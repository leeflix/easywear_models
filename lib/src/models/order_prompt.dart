import 'dart:convert';

class OrderPrompt {
  String? starterKitName;
  String supplierDomainId;

  OrderPrompt({
    required this.starterKitName,
    required this.supplierDomainId,
  });

  OrderPrompt.fromJson(Map<String, dynamic> json)
      : starterKitName = json["starterKitName"],
        supplierDomainId = json["supplierDomainId"];

  Map<String, dynamic> toJson() => {
        "starterKitName": starterKitName,
        "supplierDomainId": supplierDomainId,
      };

  @override
  String toString() => jsonEncode(this);
}