import 'model.dart';

class Location extends Model<Location> {
  String name;
  Set<String> departmentIds;

  Location({
    required super.id,
    required this.name,
    required this.departmentIds,
  });

  Location.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      departmentIds = Set<String>.from(json["departmentIds"]),
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "departmentIds": departmentIds.toList(),
  };

  @override
  Location fromJson(Map<String, dynamic> json) => Location.fromJson(json);

  @override
  String className() => "Location";
}
