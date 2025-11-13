import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class PackageEntry {
  bool? userPays;

  int amount;
  int? amountHandled;

  bool? rejected;
  int? toBuy;
  int? fromWarehouse;

  double? cost;
  Id<Department>? departmentId;
  Id<Location>? locationId;
  Id<Location>? sourceLocationId; // null = company warehouse, otherwise = location warehouse
  DateTime? booked;

  double? shopPrice;

  DateTime? received;

  String? customizationNote;


  PackageEntry({
    required this.amount,
    required this.amountHandled,
    required this.userPays,
    required this.toBuy,
    required this.fromWarehouse,
    required this.shopPrice,
    required this.cost,
    required this.departmentId,
    required this.locationId,
    required this.sourceLocationId,
    required this.booked,
    required this.received,
    this.customizationNote,
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
        "locationId": locationId,
        "sourceLocationId": sourceLocationId,
        "booked": booked?.toIso8601String(),
        "received": received?.toIso8601String(),
        "customizationNote": customizationNote,
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
        locationId = json["locationId"],
        sourceLocationId = json["sourceLocationId"],
        booked = json["booked"] == null ? null : DateTime.parse(json["booked"]),
        received = json["received"] == null ? null : DateTime.parse(json["received"]),
        customizationNote = json["customizationNote"];

  @override
  String toString() => jsonEncode(this);
}
