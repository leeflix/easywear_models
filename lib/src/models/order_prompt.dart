import 'dart:convert';

class OrderPrompt {
  String? starterKitName;
  Map<String, int> workwearIdToAmount;

  OrderPrompt({
    this.starterKitName,
    required this.workwearIdToAmount,
  });

  OrderPrompt.fromJson(Map<String, dynamic> json)
      : starterKitName = json["starterKitName"],
        workwearIdToAmount = Map<String, int>.from(json["workwearIdToAmount"]);

  Map<String, dynamic> toJson() => {
        "starterKitName": starterKitName,
        "workwearIdToAmount": workwearIdToAmount,
      };

  @override
  String toString() => jsonEncode(this);
}