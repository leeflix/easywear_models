import 'model.dart';

class Department extends Model<Department> {
  String name;
  Set<String> userIds;
  Map<String, double?> shop;

  Department({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.userIds,
    required this.shop,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Department.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        userIds = Set.from(json["userIds"]),
        shop = Map.from(json["shop"]),
        super(
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
        "shop": shop,
        ...super.toJson(),
      };

  @override
  Department fromJson(Map<String, dynamic> json) => Department.fromJson(json);

  @override
  String className() => "Department";
}
