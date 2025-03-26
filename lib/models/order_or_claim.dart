import 'request.dart';

abstract class OrderOrClaim extends Request {
  String workwearId;
  String? sku;
  Map<String, String?> config;
  int amount;
  int? toBuy;
  int? fromWarehouse;
  double? cost;
  String? departmentId;
  DateTime? booked;

  OrderOrClaim({
    required super.id,
    required super.created,
    required super.updated,
    required super.isArchived,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.workwearId,
    required this.sku,
    required this.config,
    required this.amount,
    required this.toBuy,
    required this.fromWarehouse,
    required this.cost,
    required this.departmentId,
    required this.booked,
  });

  @override
  Map<String, dynamic> toJson() => {
        "workwearId": workwearId,
        "sku": sku,
        "config": config,
        "amount": amount,
        "toBuy": toBuy,
        "fromWarehouse": fromWarehouse,
        "cost": cost,
        "departmentId": departmentId,
        "booked": booked?.toIso8601String(),
        ...super.toJson(),
      };
}
