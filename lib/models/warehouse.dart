import 'inventory.dart';
import 'model.dart';

class Warehouse extends Model<Warehouse> {
  Inventory inventory;

  Warehouse({
    required super.created,
    required super.updated,
    required super.isArchived,
    required this.inventory,
  }) : super(id: "0");

  Warehouse.fromJson(Map<String, dynamic> json)
      : inventory = Inventory.fromJson(json["inventory"]),
        super(
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  Map<String, dynamic> toJson() => {
        "inventory": inventory.toJson(),
        ...super.toJson(),
      };

  @override
  Warehouse fromJson(Map<String, dynamic> json) => Warehouse.fromJson(json);

  @override
  String className() => "Warehouse";
}
