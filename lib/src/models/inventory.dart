import 'dart:async';

class Inventory {
  Map<String, Map<String, int>> items;

  Inventory({required this.items});

  Inventory.empty() : items = {};

  Map<String, dynamic> toJson() => {"items": items};

  Inventory.fromJson(Map<String, dynamic> json)
      : items = Map.from(json["items"]).map(
          (workwearId, skuToAmount) => MapEntry(
            workwearId,
            Map<String, int>.from(skuToAmount),
          ),
        );

  Set<String> workwearIds() => items.keys.toSet();

  void setAmountInInventory({
    required String workwearId,
    required String sku,
    required int amount,
  }) {
    if (!items.containsKey(workwearId)) items[workwearId] = {};
    if (amount == 0) {
      items[workwearId]!.remove(sku);
      if (items[workwearId]!.isEmpty) {
        items.remove(workwearId);
      }
    } else {
      items[workwearId]![sku] = amount;
    }
  }

  void updateAmountInInventory({
    required String workwearId,
    required String sku,
    required int amount,
  }) =>
      setAmountInInventory(
        workwearId: workwearId,
        sku: sku,
        amount: readAmountOfItem(workwearId: workwearId, sku: sku) + amount,
      );

  int readAmountOfItem({
    required String workwearId,
    required String sku,
  }) =>
      items[workwearId]?[sku] ?? 0;

  bool has({
    required String workwearId,
    required String sku,
    required int amount,
  }) =>
      readAmountOfItem(workwearId: workwearId, sku: sku) >= amount;

  bool contains({required Inventory inventory}) {
    for (var workwearId in inventory.workwearIds()) {
      for (var sku in inventory.items[workwearId]!.keys) {
        if (!has(
          workwearId: workwearId,
          sku: sku,
          amount: inventory.readAmountOfItem(workwearId: workwearId, sku: sku),
        )) {
          return false;
        }
      }
    }
    return true;
  }

  int? maxAmount() {
    int? maxAmount;
    for (var workwearId in items.keys) {
      for (var sku in items[workwearId]!.keys) {
        if (maxAmount == null || items[workwearId]![sku]! > maxAmount) {
          maxAmount = items[workwearId]![sku]!;
        }
      }
    }
    return maxAmount;
  }

  List<T> iterateSync<T>(
    T Function(
      String workwearId,
      String sku,
      int amount,
    ) fn,
  ) {
    List<T> results = [];
    for (var workwearId in workwearIds()) {
      for (var sku in items[workwearId]!.keys) {
        results.add(
          fn(
            workwearId,
            sku,
            items[workwearId]![sku]!,
          ),
        );
      }
    }
    return results;
  }

  FutureOr<List<T>> iterateAsync<T>(
    FutureOr<T> Function(
      String workwearId,
      String sku,
      int amount,
    ) fn,
  ) async {
    List<T> results = [];
    for (var workwearId in workwearIds()) {
      for (var sku in items[workwearId]!.keys) {
        results.add(
          await fn(
            workwearId,
            sku,
            items[workwearId]![sku]!,
          ),
        );
      }
    }
    return results;
  }

  void addInventory({required Inventory inventory}) {
    inventory.iterateSync(
      (workwearId, sku, amount) => updateAmountInInventory(
        workwearId: workwearId,
        sku: sku,
        amount: amount,
      ),
    );
  }
}
