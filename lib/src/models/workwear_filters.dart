class WorkwearFilters {
  final Set<String> supplierIds;
  final Map<String, Set<String>> propertiesToOptions;
  final double minCost;
  final double maxCost;
  final int count;

  WorkwearFilters({
    required this.supplierIds,
    required this.propertiesToOptions,
    required this.minCost,
    required this.maxCost,
    required this.count,
  });

  WorkwearFilters.fromJson(Map<String, dynamic> json)
      : supplierIds = Set.from(json["supplierIds"]),
        propertiesToOptions = Map.from(json["propertiesToOptions"]).map((key, value) => MapEntry(key, Set.from(value))),
        minCost = json["minCost"],
        maxCost = json["maxCost"],
        count = json["count"];
}