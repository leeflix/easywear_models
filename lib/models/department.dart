import 'model.dart';

class Department extends Model<Department> {
  String name;
  Set<String> userIds;
  DateTime created;
  Map<String, double?> shop;

  Department({
    required super.id,
    required this.name,
    required this.userIds,
    required this.created,
    required this.shop,
  });

  Department.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      userIds = Set.from(json["userIds"]),
      created = DateTime.parse(json["created"]),
      shop = Map.from(
        json["shop"],
      ).map((key, value) => MapEntry(key, value?.toDouble())),
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "userIds": userIds.toList(),
    "created": created.toIso8601String(),
    "shop": shop,
  };

  @override
  Department fromJson(Map<String, dynamic> json) => Department.fromJson(json);

  @override
  String className() => "Department";
}
