import 'model.dart';

class Code extends Model<Code> {
  String code;
  String? departmentId;
  bool isAdmin;
  int uses;
  int maxUses;
  double initialBudget;
  double budgetPerMonth;
  bool askForInventoryAfterFirstLogin;

  Code({
    required super.id,
    required super.created,
    required super.updated,
    required super.isArchived,
    required this.code,
    required this.departmentId,
    required this.isAdmin,
    required this.uses,
    required this.maxUses,
    required this.initialBudget,
    required this.budgetPerMonth,
    required this.askForInventoryAfterFirstLogin,
  });

  Code.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        departmentId = json["departmentId"],
        isAdmin = json["isAdmin"],
        uses = json["uses"],
        maxUses = json["maxUses"],
        initialBudget = json["initialBudget"].toDouble(),
        budgetPerMonth = json["budgetPerMonth"].toDouble(),
        askForInventoryAfterFirstLogin = json["askForInventoryAfterFirstLogin"],
        super(
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "code": code,
        "departmentId": departmentId,
        "isAdmin": isAdmin,
        "uses": uses,
        "maxUses": maxUses,
        "initialBudget": initialBudget,
        "budgetPerMonth": budgetPerMonth,
        "askForInventoryAfterFirstLogin": askForInventoryAfterFirstLogin,
        ...super.toJson(),
      };

  @override
  Code fromJson(Map<String, dynamic> json) => Code.fromJson(json);

  @override
  String className() => "Code";
}
