import 'inventory.dart';
import 'model.dart';

class Warehouse extends Model<Warehouse> {
  Inventory inventory;

  Warehouse({required this.inventory}) : super(id: "0");

  Warehouse.fromJson(Map<String, dynamic> json)
    : inventory = Inventory.fromJson(json["inventory"]),
      super(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id, "inventory": inventory.toJson()};

  @override
  Warehouse fromJson(Map<String, dynamic> json) => Warehouse.fromJson(json);

  @override
  String className() => "Warehouse";
}
