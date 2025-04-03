class Permissions {
  Set<String> domainIds;
  Set<String> locationIds;
  Set<String> departmentIds;

  Permissions({
    required this.domainIds,
    required this.locationIds,
    required this.departmentIds,
  });

  Permissions.fromJson(Map<String, dynamic> json)
      : domainIds = Set<String>.from(json["domainIds"]),
        locationIds = Set<String>.from(json["locationIds"]),
        departmentIds = Set<String>.from(json["departmentIds"]);

  Map<String, dynamic> toJson() => {
        "domainIds": domainIds.toList(),
        "locationIds": locationIds.toList(),
        "departmentIds": departmentIds.toList(),
      };
}
