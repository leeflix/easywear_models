import 'order_or_claim.dart';
import 'request.dart';
import 'request_status.dart';

class Order extends OrderOrClaim {
  bool userPays;

  Order({
    required super.id,
    required super.created,
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
        userId: json["userId"],
        status: RequestStatusE.fromString(json["status"]),
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
    "id": id,
    "userId": userId,
    "created": created.toIso8601String(),
    "status": status.string,
    "adminMessage": adminMessage,
    "userMessage": userMessage,
    "workwearId": workwearId,
    "config": config,
    "amount": amount,
    "cost": cost,
    "departmentId": departmentId,
    "booked": booked?.toIso8601String(),
    "toBuy": toBuy,
    "fromWarehouse": fromWarehouse,
    "userPays": userPays,
  };

  @override
  Request fromJson(Map<String, dynamic> json) => Order.fromJson(json);
}
