  import 'package:easywear_models/easywear_models.dart';

  class Permissions {
    Set<DomainId> domainIds;
    Set<LocationId> locationIds;
    Set<DepartmentId> departmentIds;

    Permissions({
      required this.domainIds,
      required this.locationIds,
      required this.departmentIds,
    });

    Permissions.fromJson(Map<String, dynamic> json)
        : domainIds = Set<DomainId>.from(json["domainIds"]),
          locationIds = Set<LocationId>.from(json["locationIds"]),
          departmentIds = Set<DepartmentId>.from(json["departmentIds"]);

    Map<String, dynamic> toJson() => {
          "domainIds": domainIds.toList(),
          "locationIds": locationIds.toList(),
          "departmentIds": departmentIds.toList(),
        };

    Permissions.none()
        : domainIds = {},
          locationIds = {},
          departmentIds = {};
  }
