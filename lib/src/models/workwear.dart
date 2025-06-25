import 'article.dart';
import 'category.dart';
import 'model.dart';

class Workwear extends Model<Workwear> {
  String name;
  Set<String> imageIds;
  Set<Category> categories;
  Map<String, Article> skuToArticle;
  String? customSupplier;

  Workwear({
    required super.domainId,
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.imageIds,
    required this.categories,
    required this.skuToArticle,
    required this.customSupplier,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Workwear.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        imageIds = Set<String>.from(json["imageIds"]),
        categories = Set<Category>.from(
            json["categories"].map((e) => CategoryExt.fromString(e))),
        skuToArticle = json["skuToArticle"].map<String, Article>((key, value) =>
            MapEntry<String, Article>(key, Article.fromJson(value))),
        customSupplier = json["customSupplier"],
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
        "categories": categories.map((e) => e.string).toList(),
        "skuToArticle": skuToArticle.map((k, v) => MapEntry(k, v.toJson())),
        "customSupplier": customSupplier,
        ...super.toJson(),
      };

  @override
  Workwear fromJson(Map<String, dynamic> json) => Workwear.fromJson(json);

  @override
  String className() => "Workwear";

  double? minCost({required String domainId}) {
    double? minCost;
    for (var article in skuToArticle.values) {
      if (article.minCost(domainId: domainId) != null) {
        if (minCost == null || article.minCost(domainId: domainId)! < minCost) {
          minCost = article.minCost(domainId: domainId);
        }
      }
    }
    return minCost;
  }

  double? maxCost({required String domainId}) {
    double? maxCost;
    for (var article in skuToArticle.values) {
      if (article.maxCost(domainId: domainId) != null) {
        if (maxCost == null || article.maxCost(domainId: domainId)! > maxCost) {
          maxCost = article.maxCost(domainId: domainId);
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

  Article? cheapestArticle({required String domainId}) {
    Article? cheapest;
    for (var article in skuToArticle.values) {
      double? minCost = article.minCost(domainId: domainId);
      if (minCost == null) continue;
      if (cheapest == null || minCost < cheapest.minCost(domainId: domainId)!) {
        cheapest = article;
      }
    }
    return cheapest;
  }

  Set<int> quantityBreaks() {
    Set<int> quantityBreaks = Set<int>();
    for (var article in skuToArticle.values) {
      quantityBreaks.addAll(article.defaultCost.keys);
    }
    return quantityBreaks;
  }

  Set<Article> hasArticleWithConfiguration({
    required Map<String, String?> configuration,
    required bool strict,
  }) {
    return skuToArticle.values
        .where(
          (article) => article.matchConfiguration(
            configuration: configuration,
            strict: strict,
          ),
        )
        .toSet();
  }
}
