import 'order_or_claim.dart';
import 'request.dart';
import 'request_status.dart';

class Order extends OrderOrClaim {
  bool userPays;

  Order({
    required super.id,
    required super.created,
    required super.updated,
    required super.isArchived,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required super.workwearId,
    required super.amount,
    required super.config,
    required super.sku,
    required super.cost,
    required super.departmentId,
    required super.booked,
    required super.toBuy,
    required super.fromWarehouse,
    required this.userPays,
  });

  Order.fromJson(Map<String, dynamic> json)
    : userPays = json["userPays"],
      super(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isArchived: json["isArchived"],
        userId: json["userId"],
        status: RequestStatusExt.fromString(json["status"]),
        adminMessage: json["adminMessage"],
        userMessage: json["userMessage"],
        workwearId: json["workwearId"],
        config: Map<String, String?>.from(json["config"]),
        sku: json["sku"],
        amount: json["amount"],
        cost: json["cost"]?.toDouble(),
        departmentId: json["departmentId"],
        booked: json["booked"] == null ? null : DateTime.parse(json["booked"]),
        toBuy: json["toBuy"],
        fromWarehouse: json["fromWarehouse"],
      );

  @override
  Map<String, dynamic> toJson() => {
    "type": "order",
    "userPays": userPays,
    ...super.toJson(),
  };

  @override
  Request fromJson(Map<String, dynamic> json) => Order.fromJson(json);

  @override
  String className() => "Order";
}


