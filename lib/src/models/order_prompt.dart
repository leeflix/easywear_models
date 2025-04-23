import 'dart:convert';

class OrderPrompt {
  String? starterKitName;
  Map<String, int> workwearIdToAmount;
  String? supplierDomainId;

  OrderPrompt({
    this.starterKitName,
    required this.workwearIdToAmount,
    this.supplierDomainId,
  });

  OrderPrompt.fromJson(Map<String, dynamic> json)
      : starterKitName = json["starterKitName"],
        workwearIdToAmount = Map<String, int>.from(json["workwearIdToAmount"]),
        supplierDomainId = json["supplierDomainId"];

  Map<String, dynamic> toJson() => {
        "starterKitName": starterKitName,
        "workwearIdToAmount": workwearIdToAmount,
        "supplierDomainId": supplierDomainId,
      };

  @override
  String toString() => jsonEncode(this);
}