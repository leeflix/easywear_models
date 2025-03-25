import 'package:easywear_models/models/country.dart';

import 'gender.dart';

class Address {
  final Gender gender;
  final Country country;
  final String companyName;
  final String firstName;
  final String lastName;
  final String streetAndHouseNumber;
  final String addressLine2;
  final String zipCode;
  final String city;

  Address({
    required this.gender,
    required this.country,
    required this.companyName,
    required this.firstName,
    required this.lastName,
    required this.streetAndHouseNumber,
    required this.addressLine2,
    required this.zipCode,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
    "gender": gender.string,
    "country": country.string,
    "companyName": companyName,
    "firstName": firstName,
    "lastName": lastName,
    "streetAndHouseNumber": streetAndHouseNumber,
    "addressLine2": addressLine2,
    "zipCode": zipCode,
    "city": city,
  };

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      companyName: json["companyName"],
      gender: GenderExtension.fromString(json["gender"]),
      country: ShippingCountryExtension.fromString(json["country"]),
      firstName: json["firstName"],
      lastName: json["lastName"],
      streetAndHouseNumber: json["streetAndHouseNumber"],
      addressLine2: json["addressLine2"],
      zipCode: json["zipCode"],
      city: json["city"],
    );
  }
}