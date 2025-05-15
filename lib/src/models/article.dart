import 'dart:convert';

class Article {
  String sku;
  Map<String, String> configuration;
  Set<String> imageIds;
  Map<int, double> cost;
  Map<int, double> oldCost;

  Article({
    required this.sku,
    required this.configuration,
    required this.imageIds,
    required this.cost,
    required this.oldCost,
  });

  Article.fromJson(Map<String, dynamic> json)
      : sku = json["sku"],
        configuration = json["configuration"].map<String, String>(
            (key, value) => MapEntry<String, String>(key, value)),
        imageIds = Set<String>.from(json["imageIds"]),
        cost = (json["cost"] as Map).map<int, double>((key, value) =>
            MapEntry<int, double>(int.parse(key), value.toDouble())),
        oldCost = (json["oldCost"] as Map).map<int, double>((key, value) =>
            MapEntry<int, double>(int.parse(key), value.toDouble()));

  Map<String, dynamic> toJson() => {
        "sku": sku,
        "configuration": configuration,
        "imageIds": imageIds.toList(),
        "cost": cost.map((k, v) => MapEntry(k.toString(), v)),
        "oldCost": oldCost.map((k, v) => MapEntry(k.toString(), v)),
      };

  @override
  String toString() => jsonEncode(this);

  double? getCostByPerItemByAmount({required int amount}) {
    double? cost;
    for (var entry in this.cost.entries) {
      if (entry.key <= amount && (cost == null || entry.value < cost)) {
        cost = entry.value;
      }
    }
    return cost;
  }

  bool matchConfiguration({
    required Map<String, String?> configuration,
    required bool strict,
  }) {
    if(strict && configuration.length != this.configuration.length) return false;
    for (var entry in configuration.entries) {
      if (this.configuration[entry.key] == null) return false;
      if (this.configuration[entry.key] != entry.value) return false;
    }
    return true;
  }
}
