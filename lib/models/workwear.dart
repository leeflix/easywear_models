import 'article.dart';
import 'model.dart';
import 'property.dart';

class Workwear extends Model<Workwear> {
  Set<String> imageIds;
  String name;
  List<Property> properties;
  bool isArchived;
  double? shopPrice;
  double? oldShopPrice;
  DateTime created;
  Map<int, double> cost;
  Map<int, double> oldCost;
  String? supplierDomainId;
  String? articleNumber;
  String? collectionId;
  Set<String> categoryIds;
  Map<String, Article> skuToArticle;
  Map<String, String> custom;

  Workwear({
    required super.id,
    required this.name,
    required this.properties,
    required this.isArchived,
    required this.created,
    required this.imageIds,
    required this.cost,
    required this.oldCost,
    required this.shopPrice,
    required this.oldShopPrice,
    required this.supplierDomainId,
    required this.collectionId,
    required this.categoryIds,
    required this.skuToArticle,
    required this.custom,
  });

  Workwear.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      properties =
          json["properties"]
              .map<Property>((propertyJson) => Property.fromJson(propertyJson))
              .toList(),
      isArchived = json["isArchived"],
      created = DateTime.parse(json["created"]),
      imageIds = Set<String>.from(json["imageIds"]),
      cost = (json["cost"] as Map).map<int, double>((key, value) {
        return MapEntry<int, double>(int.parse(key), value.toDouble());
      }),
      oldCost = (json["oldCost"] as Map).map<int, double>((key, value) {
        return MapEntry<int, double>(int.parse(key), value.toDouble());
      }),
      shopPrice = json["shopPrice"]?.toDouble(),
      oldShopPrice = json["oldShopPrice"]?.toDouble(),
      supplierDomainId = json["supplierDomainId"],
      collectionId = json["collectionId"],
      categoryIds = Set<String>.from(json["categoryIds"]),
      skuToArticle = json["skuToArticle"].map<String, Article>((key, value) {
        return MapEntry<String, Article>(key, Article.fromJson(value));
      }),
      custom = Map<String, String>.from(json["custom"]),
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "properties": properties.map((property) => property.toJson()).toList(),
    "isArchived": isArchived,
    "created": created.toIso8601String(),
    "imageIds": imageIds.toList(),
    "cost": cost.map((k, v) => MapEntry(k.toString(), v)),
    "oldCost": oldCost.map((k, v) => MapEntry(k.toString(), v)),
    "shopPrice": shopPrice,
    "oldShopPrice": oldShopPrice,
    "supplierDomainId": supplierDomainId,
    "collectionId": collectionId,
    "categoryIds": categoryIds.toList(),
    "skuToArticle": skuToArticle.map((k, v) => MapEntry(k, v.toJson())),
    "custom": custom,
  };

  @override
  Workwear fromJson(Map<String, dynamic> json) => Workwear.fromJson(json);

  @override
  String className() => "Workwear";

      bool sale() {
    if (oldCost.isNotEmpty) return true;
    for (var article in skuToArticle.values) {
      if (article.oldCost.isNotEmpty) return true;
    }
    return false;
  }

  double? minCost() {
    double? minCost;
    for (var article in skuToArticle.values) {
      for (var cost in article.cost.values) {
        if (minCost == null || cost < minCost) {
          minCost = cost;
        }
      }
    }
    for (var cost in this.cost.values) {
      if (minCost == null || cost < minCost) {
        minCost = cost;
      }
    }
    return minCost;
  }

  double? maxCost() {
    double? maxCost;
    for (var article in skuToArticle.values) {
      for (var cost in article.cost.values) {
        if (maxCost == null || cost > maxCost) {
          maxCost = cost;
        }
      }
    }
    for (var cost in this.cost.values) {
      if (maxCost == null || cost > maxCost) {
        maxCost = cost;
      }
    }
    return maxCost;
  }

  bool hasImage() {
    if (imageIds.isNotEmpty) return true;
    for (var article in skuToArticle.values) {
      if (article.imageIds.isNotEmpty) return true;
    }
    return false;
  }

  Set<String> allImages() {
    Set<String> images = Set<String>.from(imageIds);
    for (var article in skuToArticle.values) {
      images.addAll(article.imageIds);
    }
    return images;
  }
}
