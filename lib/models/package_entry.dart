import 'dart:convert';

class PackageEntry {
  int amount;
  int? toBuy;
  int? fromWarehouse;
  double? shopPrice;
  double? cost;
  String? departmentId;
  DateTime? booked;
  bool userPays;

  PackageEntry({
    required this.amount,
    required this.userPays,
    required this.toBuy,
    required this.fromWarehouse,
    required this.cost,
    required this.departmentId,
    required this.booked,
  });

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "userPays": userPays,
        "toBuy": toBuy,
        "fromWarehouse": fromWarehouse,
        "cost": cost,
        "departmentId": departmentId,
        "booked": booked?.toIso8601String(),
      };

  PackageEntry.fromJson(Map<String, dynamic> json)
      : amount = json["amount"],
        userPays = json["userPays"],
        toBuy = json["toBuy"],
        fromWarehouse = json["fromWarehouse"],
        cost = json["cost"]?.toDouble(),
        departmentId = json["departmentId"],
        booked = json["booked"] == null ? null : DateTime.parse(json["booked"]);

  @override
  String toString() => jsonEncode(this);
}
