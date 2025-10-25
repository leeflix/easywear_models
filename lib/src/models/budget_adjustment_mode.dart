enum BudgetAdjustmentMode {
  set,
  add,
}

extension BudgetAdjustmentModeExt on BudgetAdjustmentMode {
  String get string => toString().split(".").last;

  static BudgetAdjustmentMode fromString(String s) => BudgetAdjustmentMode.values.firstWhere((mode) => mode.string == s);
}
