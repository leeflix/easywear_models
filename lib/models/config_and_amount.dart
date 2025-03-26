import 'dart:convert';

class ConfigAndAmount {
  Map<String, String?> config;
  int amount;

  ConfigAndAmount({
    required this.config,
    required this.amount,
  });

  ConfigAndAmount.fromJson(Map<String, dynamic> json)
      : config = Map.from(json["config"]),
        amount = json["amount"];

  Map<String, dynamic> toJson() => {
        "config": config,
        "amount": amount,
      };

  @override
  String toString() => jsonEncode(this);
}
