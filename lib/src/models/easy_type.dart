enum EasyType {
  wear,
  it,
}

extension EasyTypeExt on EasyType {
  String get string => toString().split(".").last;

  static EasyType fromString(String s) =>
      EasyType.values.firstWhere((e) => e.string == s);
}
