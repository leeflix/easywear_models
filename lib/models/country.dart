enum Country { germany, austria, switzerland }

extension ShippingCountryExtension on Country {
  String get string => toString().split(".").last;

  static Country fromString(String string) =>
      Country.values.firstWhere((country) => country.string == string);
}