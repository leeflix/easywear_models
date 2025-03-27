import 'model.dart';

class Location extends Model<Location> {
  String name;
  Set<String> departmentIds;
  Map<String, double?> shop;

  Location({
    required super.id,
    required super.created,
    required super.updated,
    required super.isArchived,
    required this.name,
    required this.departmentIds,
    required this.shop,
  });

  Location.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        departmentIds = Set<String>.from(json["departmentIds"]),
        shop = Map<String, double?>.from(json["shop"])
            .map((key, value) => MapEntry(key, value?.toDouble())),
        super(
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "departmentIds": departmentIds.toList(),
        "shop": shop,
        ...super.toJson(),
      };

  @override
  Location fromJson(Map<String, dynamic> json) => Location.fromJson(json);

  @override
  String className() => "Location";
}
