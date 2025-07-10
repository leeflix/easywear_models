import 'package:collection/collection.dart';
import 'package:easywear_models/easywear_models.dart';

class Article extends DataClass<Article> {
  Map<String, String> configuration;
  Set<ImageId> imageIds;
  Map<Id<Domain>?, Map<int, double>> domainIdToCost = {};
  Map<Id<Domain>?, Map<int, double>> domainIdToOldCost = {};
  int? weightInGrams;
  int? stockQuantity;
  int? incomingStockQuantity;
  (int week, int year)? expectedStockArrival;

  Article({
    required this.configuration,
    required this.imageIds,
    required this.domainIdToCost,
    required this.domainIdToOldCost,
    required this.weightInGrams,
    required this.stockQuantity,
    required this.incomingStockQuantity,
    required this.expectedStockArrival,
  });

  Article.fromJson(Map<String, dynamic> json)
      : configuration = json["configuration"].map<String, String>((key, value) => MapEntry<String, String>(key, value)),
        imageIds = Set<ImageId>.from(json["imageIds"]),
        domainIdToCost = (json["domainIdToCost"] as Map).map<Id<Domain>?, Map<int, double>>(
          (key, value) => MapEntry<Id<Domain>?, Map<int, double>>(
            key == "null" ? null : key,
            (value as Map).map<int, double>((k, v) => MapEntry<int, double>(int.parse(k), v.toDouble())),
          ),
        ),
        domainIdToOldCost = (json["domainIdToOldCost"] as Map).map<Id<Domain>?, Map<int, double>>(
          (key, value) => MapEntry<Id<Domain>?, Map<int, double>>(
            key == "null" ? null : key,
            (value as Map).map<int, double>((k, v) => MapEntry<int, double>(int.parse(k), v.toDouble())),
          ),
        ),
        weightInGrams = json["weightInGrams"] == null ? null : int.parse(json["weightInGrams"]),
        stockQuantity = json["stockQuantity"] == null ? null : int.parse(json["stockQuantity"]),
        incomingStockQuantity = json["incomingStockQuantity"] == null ? null : int.parse(json["incomingStockQuantity"]),
        expectedStockArrival = json["expectedStockArrival"] == null ? null : (int.parse(json["expectedStockArrival"]["week"]), int.parse(json["expectedStockArrival"]["year"]));

  Map<String, dynamic> toJson() => {
        "configuration": configuration,
        "imageIds": imageIds.toList(),
        "domainIdToCost": domainIdToCost.map(
          (key, value) => MapEntry(
            key ?? "null",
            value.map((k, v) => MapEntry(k, v)),
          ),
        ),
        "domainIdToOldCost": domainIdToOldCost.map(
          (key, value) => MapEntry(
            key ?? "null",
            value.map((k, v) => MapEntry(k, v)),
          ),
        ),
        "weightInGrams": weightInGrams,
        "stockQuantity": stockQuantity,
        "incomingStockQuantity": incomingStockQuantity,
        "expectedStockArrival": expectedStockArrival == null
            ? null
            : {
                "week": expectedStockArrival!.$1,
                "year": expectedStockArrival!.$2,
              },
      };

  @override
  Article fromJson(Map<String, dynamic> json) => Article.fromJson(json);

  Map<int, double> getCost({required Id<Domain>? domainId}) {
    var defaultCostCopy = Map<int, double>.from(domainIdToCost[null]!);
    if (domainId != null && domainIdToCost.containsKey(domainId)) {
      var costMap = domainIdToCost[domainId]!;
      for (var entry in costMap.entries) {
        defaultCostCopy[entry.key] = entry.value;
      }
    }
    return defaultCostCopy;
  }

  Map<int, double> getOldCost({required String? domainId}) {
    var defaultOldCostCopy = Map<int, double>.from(domainIdToOldCost[null]!);
    if (domainId != null && domainIdToOldCost.containsKey(domainId)) {
      var costMap = domainIdToOldCost[domainId]!;
      for (var entry in costMap.entries) {
        defaultOldCostCopy[entry.key] = entry.value;
      }
    }
    return defaultOldCostCopy;
  }

  double? minCost({required Id<Domain>? domainId}) {
    Map<int, double> cost = getCost(domainId: domainId);
    double? minCost = cost.values.minOrNull;
    return minCost;
  }

  double? maxCost({required Id<Domain>? domainId}) {
    Map<int, double> cost = getCost(domainId: domainId);
    double? maxCost = cost.values.maxOrNull;
    return maxCost;
  }

  double? getCostByPerItemByAmount({
    required Id<Domain>? domainId,
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
    required String? domainId,
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
