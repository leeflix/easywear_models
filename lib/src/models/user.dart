import 'package:easywear_models/easywear_models.dart';

class User extends Model<User> {
  bool isAdmin;
  Permissions permissions;
  bool isVerified;
  String? firstName;
  String? lastName;
  String? personnelNumber;
  ImageId? imageId;
  String? userName;
  String? companyMail;
  String? contactMail;
  String? phoneNumber;
  Set<Address> addresses;
  String? password;
  String? passwordHash;
  Language language;
  Inventory companyInventory;
  Inventory userInventory;
  Map<Id<Workwear>, Map<String, String?>> workwearIdToDefaultConfig;
  double budgetBeforeCalculation;
  double budgetPerMonth;
  DateTime lastBudgetCalculation;
  double requiredDeposit;
  double paidDeposit;
  bool askForInventoryAfterLogin;
  bool showFirstLoginMessage;
  int? intratoolUserId;
  String? beekeeperUserId;
  List<OrderPrompt> orderPrompts;

  User({
    required super.domainId,
    Id<User>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.isAdmin,
    required this.permissions,
    required this.isVerified,
    required this.firstName,
    required this.lastName,
    required this.personnelNumber,
    required this.imageId,
    required this.userName,
    required this.companyMail,
    required this.contactMail,
    required this.phoneNumber,
    required this.addresses,
    required this.password,
    required this.passwordHash,
    required this.language,
    required this.companyInventory,
    required this.userInventory,
    required this.workwearIdToDefaultConfig,
    required this.budgetBeforeCalculation,
    required this.budgetPerMonth,
    required this.lastBudgetCalculation,
    required this.requiredDeposit,
    required this.paidDeposit,
    required this.askForInventoryAfterLogin,
    required this.showFirstLoginMessage,
    required this.intratoolUserId,
    required this.beekeeperUserId,
    required this.orderPrompts,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Map<String, dynamic> toJson() => {
        "isAdmin": isAdmin,
        "permissions": permissions.toJson(),
        "isVerified": isVerified,
        "firstName": firstName,
        "lastName": lastName,
        "personnelNumber": personnelNumber,
        "imageId": imageId,
        "userName": userName,
        "companyMail": companyMail,
        "contactMail": contactMail,
        "phoneNumber": phoneNumber,
        "addresses": addresses.map((address) => address.toJson()).toList(),
        "password": password,
        "passwordHash": passwordHash,
        "language": language.string,
        "companyInventory": companyInventory.toJson(),
        "userInventory": userInventory.toJson(),
        "workwearIdToDefaultConfig": workwearIdToDefaultConfig,
        "budgetBeforeCalculation": budgetBeforeCalculation,
        "budgetPerMonth": budgetPerMonth,
        "lastBudgetCalculation": lastBudgetCalculation.toIso8601String(),
        "requiredDeposit": requiredDeposit,
        "paidDeposit": paidDeposit,
        "askForInventoryAfterLogin": askForInventoryAfterLogin,
        "showFirstLoginMessage": showFirstLoginMessage,
        "intratoolUserId": intratoolUserId,
        "beekeeperUserId": beekeeperUserId,
        "orderPrompts": orderPrompts.map((orderPrompt) => orderPrompt.toJson()).toList(),
        ...super.toJson(),
      };

  User.fromJson(Map<String, dynamic> json)
      : isAdmin = json["isAdmin"],
        permissions = Permissions.fromJson(json["permissions"]),
        isVerified = json["isVerified"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        personnelNumber = json["personnelNumber"],
        imageId = json["imageId"],
        userName = json["userName"],
        companyMail = json["companyMail"],
        contactMail = json["contactMail"],
        phoneNumber = json["phoneNumber"],
        addresses = (json["addresses"] as List).map((address) => Address.fromJson(address)).toSet(),
        password = json["password"],
        passwordHash = json["passwordHash"],
        language = LanguageExt.fromString(json["language"]),
        companyInventory = Inventory.fromJson(json["companyInventory"]),
        userInventory = Inventory.fromJson(json["userInventory"]),
        workwearIdToDefaultConfig = Map.from(json["workwearIdToDefaultConfig"]).map(
          (workwearId, defaultConfig) => MapEntry(workwearId, Map.from(defaultConfig)),
        ),
        budgetBeforeCalculation = json["budgetBeforeCalculation"].toDouble(),
        budgetPerMonth = json["budgetPerMonth"].toDouble(),
        lastBudgetCalculation = DateTime.parse(json["lastBudgetCalculation"]),
        requiredDeposit = json["requiredDeposit"].toDouble(),
        paidDeposit = json["paidDeposit"].toDouble(),
        askForInventoryAfterLogin = json["askForInventoryAfterLogin"],
        showFirstLoginMessage = json["showFirstLoginMessage"],
        intratoolUserId = json["intratoolUserId"],
        beekeeperUserId = json["beekeeperUserId"],
        orderPrompts = List.from(json["orderPrompts"]).map((orderPrompt) => OrderPrompt.fromJson(orderPrompt)).toList(),
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  String fullName() => "$firstName $lastName";

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  String className() => "User";

  double currentBudget() {
    DateTime now = DateTime.now();
    double budget = budgetBeforeCalculation;
    if (budgetPerMonth != 0) {
      double daysSinceLastBudgetCalculation = (now.millisecondsSinceEpoch - lastBudgetCalculation.millisecondsSinceEpoch) / 1000.0 / 60.0 / 60.0 / 24.0;
      double budgetPerDay = budgetPerMonth / 30.4167;
      budget += budgetPerDay * daysSinceLastBudgetCalculation;
    }
    return budget;
  }

  void setBudget({required double budget}) {
    budgetBeforeCalculation = budget;
    lastBudgetCalculation = DateTime.now();
  }

  void updateBudget({required double amount}) => setBudget(budget: currentBudget() + amount);
}
