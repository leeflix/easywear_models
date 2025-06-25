import 'dart:convert';

class Article {
  String sku;
  Map<String, String> configuration;
  Set<String> imageIds;
  Map<int, double> defaultCost;
  Map<int, double> defaultOldCost;
  Map<String, Map<int, double>> domainIdToCost = {};
  Map<String, Map<int, double>> domainIdToOldCost = {};

  Article({
    required this.sku,
    required this.configuration,
    required this.imageIds,
    required this.defaultCost,
    required this.defaultOldCost,
    required this.domainIdToCost,
    required this.domainIdToOldCost,
  });

  Article.fromJson(Map<String, dynamic> json)
      : sku = json["sku"],
        configuration = json["configuration"].map<String, String>(
            (key, value) => MapEntry<String, String>(key, value)),
        imageIds = Set<String>.from(json["imageIds"]),
        defaultCost = (json["defaultCost"] as Map).map<int, double>(
            (key, value) =>
                MapEntry<int, double>(int.parse(key), value.toDouble())),
        defaultOldCost = (json["defaultOldCost"] as Map).map<int, double>(
            (key, value) =>
                MapEntry<int, double>(int.parse(key), value.toDouble())),
        domainIdToCost =
            (json["domainIdToCost"] as Map).map<String, Map<int, double>>(
          (key, value) => MapEntry<String, Map<int, double>>(
            key,
            (value as Map).map<int, double>(
                (k, v) => MapEntry<int, double>(int.parse(k), v.toDouble())),
          ),
        ),
        domainIdToOldCost =
            (json["domainIdToOldCost"] as Map).map<String, Map<int, double>>(
          (key, value) => MapEntry<String, Map<int, double>>(
            key,
            (value as Map).map<int, double>(
                (k, v) => MapEntry<int, double>(int.parse(k), v.toDouble())),
          ),
        );

  Map<String, dynamic> toJson() => {
        "sku": sku,
        "configuration": configuration,
        "imageIds": imageIds.toList(),
        "cost": defaultCost.map((k, v) => MapEntry(k.toString(), v)),
        "oldCost": defaultOldCost.map((k, v) => MapEntry(k.toString(), v)),
        "domainIdToCost": domainIdToCost.map(
          (key, value) => MapEntry(
            key,
            value.map((k, v) => MapEntry(k.toString(), v)),
          ),
        ),
        "domainIdToOldCost": domainIdToOldCost.map(
          (key, value) => MapEntry(
            key,
            value.map((k, v) => MapEntry(k.toString(), v)),
          ),
        ),
      };

  @override
  String toString() => jsonEncode(this);

  double? minCost({required String domainId}) {
    if (domainIdToCost.containsKey(domainId)) {
      var costMap = domainIdToCost[domainId]!;
      return costMap.values.reduce((a, b) => a < b ? a : b);
    } else {
      return null;
    }
  }

  double? maxCost({required String domainId}) {
    if (domainIdToCost.containsKey(domainId)) {
      var costMap = domainIdToCost[domainId]!;
      return costMap.values.reduce((a, b) => a > b ? a : b);
    } else {
      return null;
    }
  }

  double? getCostByPerItemByAmount({
    required String domainId,
    required int amount,
  }) {
    if (domainIdToCost.containsKey(domainId)) {
      var costMap = domainIdToCost[domainId]!;
      double? cost;
      for (var entry in costMap.entries) {
        if (entry.key <= amount && (cost == null || entry.value < cost)) {
          cost = entry.value;
        }
      }
      return cost;
    } else {
      return null;
    }
  }

  double? getOldCostByPerItemByAmount({
    required String domainId,
    required int amount,
  }) {
    if (domainIdToOldCost.containsKey(domainId)) {
      var costMap = domainIdToOldCost[domainId]!;
      double? cost;
      for (var entry in costMap.entries) {
        if (entry.key <= amount && (cost == null || entry.value < cost)) {
          cost = entry.value;
        }
      }
      return cost;
    } else {
      return null;
    }
  }

  bool matchConfiguration({
    required Map<String, String?> configuration,
    required bool strict,
  }) {
    if (strict && configuration.length != this.configuration.length)
      return false;
    for (var entry in configuration.entries) {
      if (this.configuration[entry.key] == null) return false;
      if (this.configuration[entry.key] != entry.value) return false;
    }
    return true;
  }
}
