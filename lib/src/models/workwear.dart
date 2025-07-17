import 'dart:collection';

import 'package:easywear_models/easywear_models.dart';

class Workwear extends Model<Workwear> {
  String name;
  Set<ImageId> imageIds;
  Set<Category> categories;
  Map<ArticleId, Article> skuToArticle;
  String? customSupplier;
  Gender gender;
  Set<Country>? enabledCountries;
  Set<Id<Domain>>? enabledDomainIds;
  Id<Brand>? brandId;

  Workwear({
    required super.domainId,
    Id<Workwear>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.imageIds,
    required this.categories,
    required this.skuToArticle,
    required this.customSupplier,
    required this.gender,
    required this.enabledCountries,
    required this.enabledDomainIds,
    required this.brandId,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Workwear.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        imageIds = Set<ImageId>.from(json["imageIds"]),
        categories = Set<Category>.from(json["categories"].map((e) => Category.fromString(e))),
        skuToArticle = json["skuToArticle"].map<String, Article>((key, value) => MapEntry<String, Article>(key, Article.fromJson(value))),
        customSupplier = json["customSupplier"],
        gender = Gender.fromString(json["gender"]),
        enabledCountries = json["enabledCountries"] == null ? null : Set<Country>.from(json["enabledCountries"].map((e) => Country.fromString(e))),
        enabledDomainIds = json["enabledDomainIds"] == null ? null : Set<Id<Domain>>.from(json["enabledDomainIds"].map((e) => Id<Domain>(e))),
        brandId = json["brandId"],
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
        "enabledCountries": enabledCountries?.map((e) => e.string).toList(),
        "enabledDomainIds": enabledDomainIds?.toList(),
        "brandId": brandId,
        "gender": gender.string,
        ...super.toJson(),
      };

  @override
  Workwear fromJson(Map<String, dynamic> json) => Workwear.fromJson(json);

  double? minCost({required Id<Domain>? domainId}) {
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

  double? maxCost({required Id<Domain>? domainId}) {
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

  Set<ImageId> allImages() {
    Set<ImageId> images = Set<ImageId>.from(imageIds);
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

  Map<String, Set<String>> propertiesToOptions() {
    Map<String, Set<String>> propertiesToOptionsUnordered = {};
    for (var article in skuToArticle.values) {
      for (var property in article.configuration.keys) {
        propertiesToOptionsUnordered[property] ??= {};
        propertiesToOptionsUnordered[property]!.add(article.configuration[property]!);
      }
    }

    // 1. Use SplayTreeMap with the custom naturalCompare function for keys
    final SplayTreeMap<String, Set<String>> orderedProperties = SplayTreeMap(compareAlphanumeric);

    propertiesToOptionsUnordered.forEach((propertyName, unorderedOptions) {
      // 2. Sort the options using the naturalCompare function
      final List<String> sortedOptionsList = unorderedOptions.toList()..sort(compareAlphanumeric);
      final Set<String> orderedOptionsSet = sortedOptionsList.toSet();
      // Reminder: Dart's Set does not guarantee iteration order itself.
      // The elements are added from a sorted source.

      orderedProperties[propertyName] = orderedOptionsSet;
    });

    return orderedProperties;
  }

  Set<String> properties() {
    List<String> properties = [];
    for (var article in skuToArticle.values) {
      properties.addAll(article.configuration.keys);
    }
    properties.sort(compareAlphanumeric);
    return properties.toSet();
  }

  Article? cheapestArticle({required Id<Domain>? domainId}) {
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
      quantityBreaks.addAll(article.domainIdToCost[null]!.keys);
    }
    return quantityBreaks;
  }

  Map<ArticleId, Article> hasArticleWithConfiguration({
    required Map<String, String?> configuration,
    required bool strict,
  }) {
    return Map.fromEntries(
      skuToArticle.entries.where(
        (skuToArticle) => skuToArticle.value.matchConfiguration(
          configuration: configuration,
          strict: strict,
        ),
      ),
    );
  }
}
