import 'dart:convert';

class InventoryEntry {
  String workwearId;
  Map<String, String?> config;
  int amount;

  InventoryEntry({
    required this.workwearId,
    required this.config,
    required this.amount,
  });

  InventoryEntry.fromJson(Map<String, dynamic> json)
    : workwearId = json["workwearId"],
      config = Map.from(json["config"]),
      amount = json["amount"];

  Map<String, dynamic> toJson() => {
    "workwearId": workwearId,
    "config": config,
    "amount": amount,
  };

  InventoryEntry deepCopy() =>
      InventoryEntry.fromJson(jsonDecode(jsonEncode(this)));
}
