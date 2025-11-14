import 'package:easywear_models/easywear_models.dart';

class Department extends Model<Department> {
  String name;
  Set<Id<User>> userIds;
  Map<Id<Workwear>, DepartmentWorkwearConfig> workwearConfig;

  Department({
    required super.domainId,
    Id<Department>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.userIds,
    required this.workwearConfig,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Department.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        userIds = Set.from(json["userIds"]),
        workwearConfig = (json["workwearConfig"] as Map).map(
          (key, value) => MapEntry(
            key,
            DepartmentWorkwearConfig.fromJson(value),
          ),
        ),
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
        "userIds": userIds.toList(),
        "created": created.toIso8601String(),
        "workwearConfig": workwearConfig.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
        ...super.toJson(),
      };

  @override
  Department fromJson(Map<String, dynamic> json) => Department.fromJson(json);
}
