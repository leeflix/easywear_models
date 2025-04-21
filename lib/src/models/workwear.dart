import 'article.dart';
import 'model.dart';

class Workwear extends Model<Workwear> {
  String name;
  Set<String> imageIds;
  Set<String> categoryIds;
  Map<String, Article> skuToArticle;
  String? supplierDomainId;

  Workwear({
    required super.domainId,
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.imageIds,
    required this.categoryIds,
    required this.skuToArticle,
    required this.supplierDomainId,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Workwear.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        imageIds = Set<String>.from(json["imageIds"]),
        categoryIds = Set<String>.from(json["categoryIds"]),
        skuToArticle = json["skuToArticle"].map<String, Article>((key, value) => MapEntry<String, Article>(key, Article.fromJson(value))),
        supplierDomainId = json["supplierDomainId"],
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "imageIds": imageIds.toList(),
        "categoryIds": categoryIds.toList(),
        "skuToArticle": skuToArticle.map((k, v) => MapEntry(k, v.toJson())),
        "supplierDomainId": supplierDomainId,
        ...super.toJson(),
      };

  @override
  Workwear fromJson(Map<String, dynamic> json) => Workwear.fromJson(json);

  @override
  String className() => "Workwear";

  bool sale() {
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

  Set<String> options({required String property}) {
    Set<String> options = Set<String>();
    for (var article in skuToArticle.values) {
      if (article.configuration[property] != null) {
        options.add(article.configuration[property]!);
      }
    }
    return options;
  }

  Set<String> properties() {
    Set<String> properties = Set<String>();
    for (var article in skuToArticle.values) {
      properties.addAll(article.configuration.keys);
    }
    return properties;
  }

  Map<String, Set<String>> propertiesToOptions() {
    Map<String, Set<String>> propertiesToOptions = Map<String, Set<String>>();
    for (var article in skuToArticle.values) {
      for (var property in article.configuration.keys) {
        propertiesToOptions[property] ??= {};
        propertiesToOptions[property]!.add(article.configuration[property]!);
      }
    }
    return propertiesToOptions;
  }

  Article? cheapestArticle() {
    double? minCost;
    Article? cheapestArticle;
    for (var article in skuToArticle.values) {
      for (var cost in article.cost.values) {
        if (minCost == null || cost < minCost) {
          minCost = cost;
          cheapestArticle = article;
        }
      }
    }
    return cheapestArticle;
  }

  Set<int> quantityBreaks() {
    Set<int> quantityBreaks = Set<int>();
    for (var article in skuToArticle.values) {
      quantityBreaks.addAll(article.cost.keys);
    }
    return quantityBreaks;
  }
}
