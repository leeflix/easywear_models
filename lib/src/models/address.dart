import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class Address extends DataClass<Address> {
  final String companyName;
  final Gender? gender;
  final String firstName;
  final String lastName;
  final Country country;
  final String city;
  final String zipCode;
  final String streetAndHouseNumber;
  final String addressLine2;

  Address({
    required this.companyName,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.city,
    required this.zipCode,
    required this.streetAndHouseNumber,
    required this.addressLine2,
  });

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "gender": gender?.string,
        "firstName": firstName,
        "lastName": lastName,
        "country": country.string,
        "city": city,
        "zipCode": zipCode,
        "streetAndHouseNumber": streetAndHouseNumber,
        "addressLine2": addressLine2,
      };

  Address.fromJson(Map<String, dynamic> json)
      : companyName = json["companyName"],
        gender =
            json["gender"] == null ? null : Gender.fromString(json["gender"]),
        firstName = json["firstName"],
        lastName = json["lastName"],
        country = Country.fromString(json["country"]),
        city = json["city"],
        zipCode = json["zipCode"],
        streetAndHouseNumber = json["streetAndHouseNumber"],
        addressLine2 = json["addressLine2"];

  @override
  Address fromJson(Map<String, dynamic> json) => Address.fromJson(json);

  @override
  bool operator ==(Object other) => jsonEncode(this) == jsonEncode(other);

  @override
  int get hashCode => jsonEncode(this).hashCode;
}
