enum EasyType { wear, it }

extension EasyTypeE on EasyType {
  String get string => toString().split(".").last;

  static EasyType fromString(String value) =>
      EasyType.values.firstWhere((e) => e.string == value);
}
