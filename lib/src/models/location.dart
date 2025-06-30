import 'package:easywear_models/easywear_models.dart';

class Location extends Model<Location> {
  String name;
  Set<Id<Department>> departmentIds;
  Map<Id<Workwear>, double?> shop;
  Inventory inventory;

  Location({
    required super.domainId,
    Id<Location>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.departmentIds,
    required this.shop,
    required this.inventory,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Location.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        departmentIds = Set<Id<Department>>.from(json["departmentIds"]),
        shop = (json["shop"] as Map).map((key, value) => MapEntry(key, value?.toDouble())),
        inventory = Inventory.fromJson(json["inventory"]),
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
        "departmentIds": departmentIds.toList(),
        "shop": shop,
        "inventory": inventory.toJson(),
        ...super.toJson(),
      };

  @override
  Location fromJson(Map<String, dynamic> json) => Location.fromJson(json);

  @override
  String className() => "Location";
}
