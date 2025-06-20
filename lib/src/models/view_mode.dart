enum ViewMode { user, admin, supplier }

extension ViewModeExt on ViewMode {
  String get string => toString().split('.').last;

  static ViewMode fromString(String value) => ViewMode.values.firstWhere((e) => e.string == value);
}
