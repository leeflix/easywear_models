enum Country { germany, austria, switzerland }

extension CountryExt on Country {
  String get string => toString().split(".").last;

  static Country fromString(String s) =>
      Country.values.firstWhere((country) => country.string == s);
}
