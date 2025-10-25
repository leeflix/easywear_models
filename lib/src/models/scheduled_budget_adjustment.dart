import 'dart:convert';

import 'budget_adjustment_mode.dart';

class ScheduledBudgetAdjustment {
  final DateTime date;
  final double amount;
  final BudgetAdjustmentMode mode;
  final Duration? duration;

  ScheduledBudgetAdjustment({
    required this.date,
    required this.amount,
    required this.mode,
    this.duration,
  });

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "amount": amount,
        "mode": mode.string,
        "duration": duration?.inMicroseconds,
      };

  ScheduledBudgetAdjustment.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json["date"]),
        amount = json["amount"].toDouble(),
        mode = BudgetAdjustmentModeExt.fromString(json["mode"]),
        duration = json["duration"] != null ? Duration(microseconds: json["duration"]) : null;

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(Object other) => jsonEncode(this) == jsonEncode(other);

  @override
  int get hashCode => jsonEncode(this).hashCode;
}
