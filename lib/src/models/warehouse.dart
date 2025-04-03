import 'inventory.dart';
import 'model.dart';

class Warehouse extends Model<Warehouse> {
  Inventory inventory;

  Warehouse({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.inventory,
  }) : super(
          id: id ?? "0",
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

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
