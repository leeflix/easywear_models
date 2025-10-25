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
  ScheduledBudgetAdjustment? scheduledBudgetAdjustment;
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
    this.scheduledBudgetAdjustment,
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
        "scheduledBudgetAdjustment": scheduledBudgetAdjustment?.toJson(),
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
        scheduledBudgetAdjustment = json["scheduledBudgetAdjustment"] != null ? ScheduledBudgetAdjustment.fromJson(json["scheduledBudgetAdjustment"]) : null,
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

  double currentBudget() {
    DateTime now = DateTime.now();
    double budget = budgetBeforeCalculation;
    DateTime calculationPoint = lastBudgetCalculation;

    // Apply all scheduled adjustments between lastBudgetCalculation and now
    DateTime? nextScheduledDate = scheduledBudgetAdjustment?.date;

    while (scheduledBudgetAdjustment != null &&
           nextScheduledDate != null &&
           nextScheduledDate.isAfter(lastBudgetCalculation) &&
           (nextScheduledDate.isBefore(now) || nextScheduledDate.isAtSameMomentAs(now))) {

      // Calculate accrued budget up to adjustment date
      if (budgetPerMonth != 0) {
        double days = (nextScheduledDate.millisecondsSinceEpoch - calculationPoint.millisecondsSinceEpoch) / 1000.0 / 60.0 / 60.0 / 24.0;
        budget += (budgetPerMonth / 30.4167) * days;
      }

      // Apply adjustment
      budget = scheduledBudgetAdjustment!.mode == BudgetAdjustmentMode.set
          ? scheduledBudgetAdjustment!.amount
          : budget + scheduledBudgetAdjustment!.amount;

      calculationPoint = nextScheduledDate;

      // Move to next scheduled date (in memory only for calculation)
      if (scheduledBudgetAdjustment!.duration != null) {
        nextScheduledDate = nextScheduledDate.add(scheduledBudgetAdjustment!.duration!);
      } else {
        break;
      }
    }

    // Calculate remaining days from last adjustment point to now
    if (budgetPerMonth != 0) {
      double days = (now.millisecondsSinceEpoch - calculationPoint.millisecondsSinceEpoch) / 1000.0 / 60.0 / 60.0 / 24.0;
      budget += (budgetPerMonth / 30.4167) * days;
    }

    return budget;
  }

  void setBudget({required double budget}) {
    budgetBeforeCalculation = budget;
    lastBudgetCalculation = DateTime.now();
    _advanceScheduledAdjustment();
  }

  void _advanceScheduledAdjustment() {
    // Advance scheduled adjustments that have been "committed"
    while (scheduledBudgetAdjustment != null &&
           (scheduledBudgetAdjustment!.date.isBefore(lastBudgetCalculation) || scheduledBudgetAdjustment!.date.isAtSameMomentAs(lastBudgetCalculation))) {
      if (scheduledBudgetAdjustment!.duration != null) {
        // Schedule next occurrence
        scheduledBudgetAdjustment = ScheduledBudgetAdjustment(
          date: scheduledBudgetAdjustment!.date.add(scheduledBudgetAdjustment!.duration!),
          amount: scheduledBudgetAdjustment!.amount,
          mode: scheduledBudgetAdjustment!.mode,
          duration: scheduledBudgetAdjustment!.duration,
        );
      } else {
        // One-time adjustment, clear it
        scheduledBudgetAdjustment = null;
      }
    }
  }

  void updateBudget({required double amount}) => setBudget(budget: currentBudget() + amount);
}
