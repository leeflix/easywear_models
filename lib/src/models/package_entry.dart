import 'dart:convert';

class PackageEntry {
  bool? userPays;

  int amount;
  int? amountHandled;

  bool? rejected;
  int? toBuy;
  int? fromWarehouse;

  double? cost;
  String? departmentId;
  DateTime? booked;

  double? shopPrice;

  DateTime? received;


  PackageEntry({
    required this.amount,
    required this.amountHandled,
    required this.userPays,
    required this.toBuy,
    required this.fromWarehouse,
    required this.shopPrice,
    required this.cost,
    required this.departmentId,
    required this.booked,
    required this.received,
  });

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "amountHandled": amountHandled,
        "userPays": userPays,
        "toBuy": toBuy,
        "fromWarehouse": fromWarehouse,
        "shopPrice": shopPrice,
        "cost": cost,
        "departmentId": departmentId,
        "booked": booked?.toIso8601String(),
        "received": received?.toIso8601String(),
      };

  PackageEntry.fromJson(Map<String, dynamic> json)
      : amount = json["amount"],
        amountHandled = json["amountHandled"],
        userPays = json["userPays"],
        toBuy = json["toBuy"],
        fromWarehouse = json["fromWarehouse"],
        shopPrice = json["shopPrice"]?.toDouble(),
        cost = json["cost"]?.toDouble(),
        departmentId = json["departmentId"],
        booked = json["booked"] == null ? null : DateTime.parse(json["booked"]),
        received = json["received"] == null ? null : DateTime.parse(json["received"]);

  @override
  String toString() => jsonEncode(this);
}
