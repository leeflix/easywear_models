import 'dart:async';

import 'package:easywear_models/easywear_models.dart';

class Inventory extends DataClass<Inventory> {
  Map<Id<Workwear>, Map<ArticleId, int>> items;

  Inventory({required this.items});

  Inventory.empty() : items = {};

  Map<String, dynamic> toJson() => {"items": items};

  Inventory.fromJson(Map<String, dynamic> json)
      : items = Map.from(json["items"]).map(
          (workwearId, skuToAmount) => MapEntry(
            workwearId,
            Map<ArticleId, int>.from(skuToAmount),
          ),
        );

  @override
  Inventory fromJson(Map<String, dynamic> json) => Inventory.fromJson(json);

  Set<Id<Workwear>> workwearIds() => items.keys.toSet();

  void setAmountInInventory({
    required Id<Workwear> workwearId,
    required ArticleId sku,
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
    required Id<Workwear> workwearId,
    required ArticleId sku,
    required int amount,
  }) =>
      setAmountInInventory(
        workwearId: workwearId,
        sku: sku,
        amount: readAmountOfItem(workwearId: workwearId, sku: sku) + amount,
      );

  int readAmountOfItem({
    required Id<Workwear> workwearId,
    required ArticleId sku,
  }) =>
      items[workwearId]?[sku] ?? 0;

  bool has({
    required Id<Workwear> workwearId,
    required ArticleId sku,
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

  int? minAmount() {
    int? minAmount;
    for (var workwearId in items.keys) {
      for (var sku in items[workwearId]!.keys) {
        if (minAmount == null || items[workwearId]![sku]! < minAmount) {
          minAmount = items[workwearId]![sku]!;
        }
      }
    }
    return minAmount;
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

  void iterateSync(
    void Function(
      Id<Workwear> workwearId,
      ArticleId sku,
      int amount,
    ) fn,
  ) {
    for (var workwearId in workwearIds()) {
      for (var sku in items[workwearId]!.keys) {
        fn(
          workwearId,
          sku,
          items[workwearId]![sku]!,
        );
      }
    }
  }

  Future<void> iterateAsync(
    Future<void> Function(
      Id<Workwear> workwearId,
      ArticleId sku,
      int amount,
    ) fn,
  ) async {
    for (var workwearId in workwearIds()) {
      for (var sku in items[workwearId]!.keys) {
        await fn(
          workwearId,
          sku,
          items[workwearId]![sku]!,
        );
      }
    }
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
