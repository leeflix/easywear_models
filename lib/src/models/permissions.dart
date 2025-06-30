  import 'package:easywear_models/easywear_models.dart';

  class Permissions {
    Set<Id<Domain>> domainIds;
    Set<Id<Location>> locationIds;
    Set<Id<Department>> departmentIds;

    Permissions({
      required this.domainIds,
      required this.locationIds,
      required this.departmentIds,
    });

    Permissions.fromJson(Map<String, dynamic> json)
        : domainIds = Set<Id<Domain>>.from(json["domainIds"]),
          locationIds = Set<Id<Location>>.from(json["locationIds"]),
          departmentIds = Set<Id<Department>>.from(json["departmentIds"]);

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
