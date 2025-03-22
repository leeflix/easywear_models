import 'model.dart';

class Department extends Model<Department> {
  String name;
  Set<String> userIds;
  DateTime created;
  Map<String, double?> shop;
  Set<String> adminUserIds;

  Department({
    required super.id,
    required this.name,
    required this.userIds,
    required this.created,
    required this.shop,
    required this.adminUserIds,
  });

  Department.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      userIds = Set.from(json["userIds"]),
      created = DateTime.parse(json["created"]),
      shop = Map.from(
        json["shop"],
      ).map((key, value) => MapEntry(key, value?.toDouble())),
      adminUserIds = Set.from(json["adminUserIds"]),
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "userIds": userIds.toList(),
    "created": created.toIso8601String(),
    "adminUserIds": adminUserIds.toList(),
    "shop": shop,
  };

  @override
  Department fromJson(Map<String, dynamic> json) => Department.fromJson(json);

  @override
  String className() => "Department";
}
