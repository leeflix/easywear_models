import 'package:easywear_models/easywear_models.dart';
import 'package:easywear_models/models/package.dart';

class Order extends Request {
  List<Package> packages;

  Order.fromJson(Map<String, dynamic> json)
      : packages = json["packages"]
            .map<Package>((package) => Package.fromJson(package)),
        super(
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
          userId: json["userId"],
          status: RequestStatusExt.fromString(json["status"]),
          adminMessage: json["adminMessage"],
          userMessage: json["userMessage"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "type": "order",
        "packages": packages.map((package) => package.toJson()),
        ...super.toJson(),
      };

  @override
  Request fromJson(Map<String, dynamic> json) => Order.fromJson(json);

  @override
  String className() => "Order";
}
