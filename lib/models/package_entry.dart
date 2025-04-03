import 'dart:convert';

class PackageEntry {
  bool userPays;

  // workwearId + sku
  int amount;

  bool? rejected;
  int? toBuy;
  int? fromWarehouse;

  double? cost;
  String? departmentId;
  DateTime? booked;

  double? shopPrice;



  PackageEntry({
    required this.amount,
    required this.userPays,
    required this.toBuy,
    required this.fromWarehouse,
    required this.shopPrice,
    required this.cost,
    required this.departmentId,
    required this.booked,
  });

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "userPays": userPays,
        "toBuy": toBuy,
        "fromWarehouse": fromWarehouse,
        "shopPrice": shopPrice,
        "cost": cost,
        "departmentId": departmentId,
        "booked": booked?.toIso8601String(),
      };

  PackageEntry.fromJson(Map<String, dynamic> json)
      : amount = json["amount"],
        userPays = json["userPays"],
        toBuy = json["toBuy"],
        fromWarehouse = json["fromWarehouse"],
        shopPrice = json["shopPrice"]?.toDouble(),
        cost = json["cost"]?.toDouble(),
        departmentId = json["departmentId"],
        booked = json["booked"] == null ? null : DateTime.parse(json["booked"]);

  @override
  String toString() => jsonEncode(this);
}
