import 'inventory.dart';
import 'language.dart';
import 'model.dart';

class User extends Model<User> {
  bool isAdmin;
  DateTime created;
  String? companyMail;
  String firstName;
  String lastName;
  String userName;
  String password;
  String passwordHash;
  bool isVerified;
  bool isArchived;
  double budgetBeforeCalculation;
  double budgetPerMonth;
  DateTime lastBudgetCalculation;
  double requiredDeposit;
  double paidDeposit;
  Map<String, Map<String, String?>> workwearIdToDefaultConfig;
  Inventory companyInventory;
  Inventory userInventory;
  bool askForInventoryAfterLogin;
  bool showFirstLoginMessage;
  Language language;
  String? imageId;
  String? contactMail;
  String? phoneNumber;
  String? personnelNumber;
  int? intratoolUserId;
  String? beekeeperUserId;
  List<Address> addresses;

  User({
    required super.id,
    required this.isAdmin,
    required this.created,
    required this.companyMail,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.passwordHash,
    required this.isVerified,
    required this.isArchived,
    required this.budgetBeforeCalculation,
    required this.budgetPerMonth,
    required this.lastBudgetCalculation,
    required this.requiredDeposit,
    required this.paidDeposit,
    required this.workwearIdToDefaultConfig,
    required this.companyInventory,
    required this.userInventory,
    required this.askForInventoryAfterLogin,
    required this.showFirstLoginMessage,
    required this.language,
    required this.imageId,
    required this.contactMail,
    required this.phoneNumber,
    required this.personnelNumber,
    required this.intratoolUserId,
    required this.beekeeperUserId,
    required this.addresses,
  });

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "isAdmin": isAdmin,
    "created": created.toIso8601String(),
    "companyMail": companyMail,
    "firstName": firstName,
    "lastName": lastName,
    "userName": userName,
    "password": password,
    "passwordHash": passwordHash,
    "isVerified": isVerified,
    "isArchived": isArchived,
    "budgetBeforeCalculation": budgetBeforeCalculation,
    "budgetPerMonth": budgetPerMonth,
    "lastBudgetCalculation": lastBudgetCalculation.toIso8601String(),
    "requiredDeposit": requiredDeposit,
    "paidDeposit": paidDeposit,
    "workwearIdToDefaultConfig": workwearIdToDefaultConfig,
    "companyInventory": companyInventory.toJson(),
    "userInventory": userInventory.toJson(),
    "askForInventoryAfterLogin": askForInventoryAfterLogin,
    "showFirstLoginMessage": showFirstLoginMessage,
    "language": language.string,
    "imageId": imageId,
    "contactMail": contactMail,
    "phoneNumber": phoneNumber,
    "personnelNumber": personnelNumber,
    "intratoolUserId": intratoolUserId,
    "beekeeperUserId": beekeeperUserId,
    "addresses": addresses.map((address) => address.toJson()).toList(),
  };

  User.fromJson(Map<String, dynamic> json)
    : isAdmin = json["isAdmin"],
      created = DateTime.parse(json["created"]),
      companyMail = json["companyMail"],
      firstName = json["firstName"],
      lastName = json["lastName"],
      userName = json["userName"],
      password = json["password"],
      passwordHash = json["passwordHash"],
      isVerified = json["isVerified"],
      isArchived = json["isArchived"],
      companyInventory = Inventory.fromJson(json["companyInventory"]),
      userInventory = Inventory.fromJson(json["userInventory"]),
      askForInventoryAfterLogin = json["askForInventoryAfterLogin"],
      showFirstLoginMessage = json["showFirstLoginMessage"],
      language = LanguageE.fromString(json["language"]),
      imageId = json["imageId"],
      contactMail = json["contactMail"],
      phoneNumber = json["phoneNumber"],
      personnelNumber = json["personnelNumber"],
      budgetBeforeCalculation = json["budgetBeforeCalculation"].toDouble(),
      budgetPerMonth = json["budgetPerMonth"].toDouble(),
      lastBudgetCalculation = DateTime.parse(json["lastBudgetCalculation"]),
      requiredDeposit = json["requiredDeposit"].toDouble(),
      paidDeposit = json["paidDeposit"].toDouble(),
      workwearIdToDefaultConfig = Map.from(
        json["workwearIdToDefaultConfig"],
      ).map(
        (workwearId, defaultConfig) =>
            MapEntry(workwearId, Map.from(defaultConfig)),
      ),
      intratoolUserId = json["intratoolUserId"],
      beekeeperUserId = json["beekeeperUserId"],
      addresses =
          List.from(
            json["addresses"],
          ).map((address) => Address.fromJson(address)).toList(),
      super(id: json["id"]);

  String fullName() => "$firstName $lastName";

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  String className() => "User";
}

class Address {
  final Gender gender;
  final ShippingCountry country;
  final String firstName;
  final String lastName;
  final String streetAndHouseNumber;
  final String addressLine2;
  final String zipCode;
  final String city;

  Address({
    required this.gender,
    required this.country,
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
    "firstName": firstName,
    "lastName": lastName,
    "streetAndHouseNumber": streetAndHouseNumber,
    "addressLine2": addressLine2,
    "zipCode": zipCode,
    "city": city,
  };

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
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

enum Gender { mrs, mr, diverse, preferNotToSay }

extension GenderExtension on Gender {
  String get string => toString().split(".").last;

  static Gender fromString(String string) =>
      Gender.values.firstWhere((gender) => gender.string == string);
}

enum ShippingCountry { germany, austria, switzerland }

extension ShippingCountryExtension on ShippingCountry {
  String get string => toString().split(".").last;

  static ShippingCountry fromString(String string) =>
      ShippingCountry.values.firstWhere((country) => country.string == string);
}
