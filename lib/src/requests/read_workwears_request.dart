import 'package:easywear_models/easywear_models.dart';

class ReadWorkwearsRequest {
  final String? query;
  final double? minCost;
  final double? maxCost;
  final Map<String, Set<String>> propertyToOptions;
  final Set<String>? domainIds;
  final Set<String>? categories;
  final Sort? sort;

  final int? page;
  final int? limit;

  ReadWorkwearsRequest({
    required this.query,
    required this.minCost,
    required this.maxCost,
    required this.propertyToOptions,
    required this.domainIds,
    required this.categories,
    required this.page,
    required this.limit,
    required this.sort,
  });

  Map<String, dynamic> toJson() {
    return {
      "query": query,
      "minCost": minCost,
      "maxCost": maxCost,
      "propertyToOptions": propertyToOptions,
      "domainIds": domainIds?.toList(),
      "categories": categories?.toList(),
      "sort": sort?.string,
      "page": page,
      "limit": limit,
    };
  }
}