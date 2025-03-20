import 'dart:convert';

class Article {
  String sku;
  Map<String, String> configuration;
  Map<int, double> cost;
  Map<int, double> oldCost;
  Map<String, String?> custom;
  Set<String> imageIds;

  Article({
    required this.sku,
    required this.configuration,
    required this.cost,
    required this.oldCost,
    required this.custom,
    required this.imageIds,
  });

  Article.fromJson(Map<String, dynamic> json)
    : sku = json["sku"],
      configuration = json["configuration"].map<String, String>((key, value) {
        return MapEntry<String, String>(key, value);
      }),
      cost = (json["cost"] as Map).map<int, double>((key, value) {
        return MapEntry<int, double>(int.parse(key), value.toDouble());
      }),
      oldCost = (json["oldCost"] as Map).map<int, double>((key, value) {
        return MapEntry<int, double>(int.parse(key), value.toDouble());
      }),
      custom = Map<String, String?>.from(json["custom"]),
      imageIds = Set<String>.from(json["imageIds"]);

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "configuration": configuration,
    "cost": cost.map((k, v) => MapEntry(k.toString(), v)),
    "oldCost": oldCost.map((k, v) => MapEntry(k.toString(), v)),
    "custom": custom,
    "imageIds": imageIds.toList(),
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
}
