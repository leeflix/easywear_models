import 'request.dart';

abstract class OrderOrClaim extends Request {
  String workwearId;
  int amount;
  Map<String, String?> config;
  String? sku;
  double? cost;
  String? departmentId;
  DateTime? booked;
  int? toBuy;
  int? fromWarehouse;

  OrderOrClaim({
    required super.id,
    required super.userId,
    required super.created,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.workwearId,
    required this.config,
    required this.sku,
    required this.amount,
    required this.cost,
    required this.departmentId,
    required this.booked,
    required this.toBuy,
    required this.fromWarehouse,
  });
}
