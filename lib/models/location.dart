import 'model.dart';

class Location extends Model<Location> {
  String name;
  Set<String> departmentIds;
  Set<String> adminUserIds;

  Location({
    required super.id,
    required this.name,
    required this.departmentIds,
    required this.adminUserIds,
  });

  Location.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      departmentIds = Set<String>.from(json["departmentIds"]),
      adminUserIds = Set<String>.from(json["adminUserIds"]),
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "departmentIds": departmentIds.toList(),
    "adminUserIds": adminUserIds.toList(),
  };

  @override
  Location fromJson(Map<String, dynamic> json) => Location.fromJson(json);
}
