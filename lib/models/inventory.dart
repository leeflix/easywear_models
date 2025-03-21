import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';

import 'config_and_amount.dart';
import 'inventory_entry.dart';

class Inventory {
  Map<String, Map<String, ConfigAndAmount>> items;

  Inventory({required this.items});

  Map<String, dynamic> toJson() => {
    "items": items.map(
      (category, itemMap) => MapEntry(
        category,
        itemMap.map((name, entry) => MapEntry(name, entry.toJson())),
      ),
    ),
  };

  Inventory.fromJson(Map<String, dynamic> json)
    : items = Map.from(json["items"]).map(
        (workwearId, rest) => MapEntry(
          workwearId,
          Map.from(rest).map(
            (configHash, inventoryEntryJson) => MapEntry(
              configHash,
              ConfigAndAmount.fromJson(inventoryEntryJson),
            ),
          ),
        ),
      );

  List<InventoryEntry> toInventoryEntries() {
    List<InventoryEntry> inventoryEntries = [];
    for (String workwearId in items.keys) {
      for (String configHash in items[workwearId]!.keys) {
        ConfigAndAmount configAndAmount = items[workwearId]![configHash]!;
        inventoryEntries.add(
          InventoryEntry(
            workwearId: workwearId,
            config: configAndAmount.config,
            amount: configAndAmount.amount,
          ),
        );
      }
    }
    return inventoryEntries;
  }

  Set<String> workwearids() =>
      items.keys.toSet().map((workwearId) => workwearId).toSet();

  void setAmountInInventory({
    required String workwearId,
    required Map<String, String?> config,
    required int amount,
  }) {
    String configHash = calculateConfigHash(config);
    ConfigAndAmount? configAndAmount = items[workwearId]?[configHash];
    configAndAmount ??= ConfigAndAmount(config: config, amount: amount);
    if (!items.containsKey(workwearId)) items[workwearId] = {};
    items[workwearId]![configHash] = configAndAmount;
    if (amount == 0) {
      items[workwearId]!.remove(configHash);
      if (items[workwearId]!.isEmpty) {
        items.remove(workwearId);
      }
    } else {
      configAndAmount.amount = amount;
    }
  }

  void updateAmountInInventory({
    required String workwearId,
    required Map<String, String?> config,
    required int amount,
  }) {
    String configHash = calculateConfigHash(config);
    ConfigAndAmount? configAndAmount = items[workwearId]?[configHash];
    configAndAmount ??= ConfigAndAmount(config: config, amount: 0);
    if (!items.containsKey(workwearId)) items[workwearId] = {};
    items[workwearId]![configHash] = configAndAmount;
    configAndAmount.amount += amount;
    if (configAndAmount.amount == 0) {
      items[workwearId]!.remove(configHash);
      if (items[workwearId]!.isEmpty) {
        items.remove(workwearId);
      }
    }
  }

  void updatePropertyInInventory({
    required String workwearId,
    required Map<String, String?> config,
    required String property,
    required String? option,
  }) {
    String configHash = calculateConfigHash(config);
    ConfigAndAmount configAndAmount = items[workwearId]![configHash]!;
    configAndAmount.config[property] = option;
    String newConfigHash = calculateConfigHash(configAndAmount.config);
    items[workwearId]!.remove(configHash);
    items[workwearId]![newConfigHash] = configAndAmount;
  }

  int readAmountOfItem({
    required String workwearId,
    required Map<String, String?> config,
  }) => items[workwearId]?[calculateConfigHash(config)]?.amount ?? 0;

  static bool has({
    required String workwearId,
    required Map<String, String?> config,
    required int amount,
  }) => items[workwearId]?[calculateConfigHash(config)]?.amount ?? 0 >= amount;
}

String calculateConfigHash(Map<String, String?> config) =>
    md5
        .convert(
          utf8.encode(
            "{${config.entries.sorted((a, b) => a.key.compareTo(b.key)).map((e) => "\"${e.key}\":\"${e.value}\"").join(",")}}",
          ),
        )
        .toString();
