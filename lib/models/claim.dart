import 'order_or_claim.dart';
import 'request.dart';
import 'request_status.dart';

class Claim extends OrderOrClaim {
  Set<String> imageIds;
  bool userInventory;

  Claim({
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
    required this.imageIds,
    required this.userInventory,
  });

  @override
  Claim.fromJson(Map<String, dynamic> json)
    : imageIds = Set<String>.from(json["imageIds"]),
      userInventory = json["userInventory"],
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
    "type": "claim",
    "id": id,
    "created": created.toIso8601String(),
    "userId": userId,
    "status": status.string,
    "adminMessage": adminMessage,
    "userMessage": userMessage,
    "workwearId": workwearId,
    "amount": amount,
    "config": config,
    "cost": cost,
    "departmentId": departmentId,
    "booked": booked?.toIso8601String(),
    "toBuy": toBuy,
    "fromWarehouse": fromWarehouse,
    "imageIds": imageIds.toList(),
    "userInventory": userInventory,
  };

  @override
  Request fromJson(Map<String, dynamic> json) => Claim.fromJson(json);

  @override
  String className() => "Claim";
}
