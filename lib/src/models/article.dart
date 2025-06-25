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
        configuration = json["configuration"].map<String, String>((key, value) => MapEntry<String, String>(key, value)),
        imageIds = Set<String>.from(json["imageIds"]),
        defaultCost = (json["defaultCost"] as Map).map<int, double>((key, value) => MapEntry<int, double>(int.parse(key), value.toDouble())),
        defaultOldCost = (json["defaultOldCost"] as Map).map<int, double>((key, value) => MapEntry<int, double>(int.parse(key), value.toDouble())),
        domainIdToCost = (json["domainIdToCost"] as Map).map<String, Map<int, double>>(
          (key, value) => MapEntry<String, Map<int, double>>(
            key,
            (value as Map).map<int, double>((k, v) => MapEntry<int, double>(int.parse(k), v.toDouble())),
          ),
        ),
        domainIdToOldCost = (json["domainIdToOldCost"] as Map).map<String, Map<int, double>>(
          (key, value) => MapEntry<String, Map<int, double>>(
            key,
            (value as Map).map<int, double>((k, v) => MapEntry<int, double>(int.parse(k), v.toDouble())),
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

  Map<int, double> getCost({required String? domainId}) {
    var defaultCostCopy = Map<int, double>.from(defaultCost);
    if (domainId != null && domainIdToCost.containsKey(domainId)) {
      var costMap = domainIdToCost[domainId]!;
      for (var entry in costMap.entries) {
        defaultCostCopy[entry.key] = entry.value;
      }
    }
    return defaultCostCopy;
  }

  Map<int, double> getOldCost({required String? domainId}) {
    var defaultOldCostCopy = Map<int, double>.from(defaultOldCost);
    if (domainId != null && domainIdToOldCost.containsKey(domainId)) {
      var costMap = domainIdToOldCost[domainId]!;
      for (var entry in costMap.entries) {
        defaultOldCostCopy[entry.key] = entry.value;
      }
    }
    return defaultOldCostCopy;
  }

  double? minCost({required String? domainId}) {
    Map<int, double> cost = getCost(domainId: domainId);
    double? minCost = cost.values.reduce((a, b) => a < b ? a : b);
    return minCost;
  }

  double? maxCost({required String? domainId}) {
    Map<int, double> cost = getCost(domainId: domainId);
    double? maxCost = cost.values.reduce((a, b) => a > b ? a : b);
    return maxCost;
  }

  double? getCostByPerItemByAmount({
    required String domainId,
    required int amount,
  }) {
    Map<int, double> cost = getCost(domainId: domainId);
    if (cost.isEmpty) return null;
    double? costValue;
    for (var entry in cost.entries) {
      if (entry.key <= amount && (costValue == null || entry.value < costValue)) {
        costValue = entry.value;
      }
    }
    return costValue;
  }

  double? getOldCostByPerItemByAmount({
    required String domainId,
    required int amount,
  }) {
    Map<int, double> oldCost = getOldCost(domainId: domainId);
    if (oldCost.isEmpty) return null;
    double? costValue;
    for (var entry in oldCost.entries) {
      if (entry.key <= amount && (costValue == null || entry.value < costValue)) {
        costValue = entry.value;
      }
    }
    return costValue;
  }

  bool matchConfiguration({
    required Map<String, String?> configuration,
    required bool strict,
  }) {
    if (strict && configuration.length != this.configuration.length) return false;
    for (var entry in configuration.entries) {
      if (this.configuration[entry.key] == null) return false;
      if (this.configuration[entry.key] != entry.value) return false;
    }
    return true;
  }
}
