import 'model.dart';

class Code extends Model<Code> {
  String? departmentId;
  int uses;
  int maxUses;
  String code;
  bool askForInventoryAfterFirstLogin;
  bool isAdmin;
  DateTime created;
  double initialBudget;
  double budgetPerMonth;

  Code({
    required super.id,
    required this.departmentId,
    required this.uses,
    required this.maxUses,
    required this.code,
    required this.askForInventoryAfterFirstLogin,
    required this.isAdmin,
    required this.created,
    required this.initialBudget,
    required this.budgetPerMonth,
  });

  Code.fromJson(Map<String, dynamic> json)
    : departmentId = json["departmentId"],
      uses = json["uses"],
      maxUses = json["maxUses"],
      code = json["code"],
      askForInventoryAfterFirstLogin = json["askForInventoryAfterFirstLogin"],
      initialBudget = json["initialBudget"].toDouble(),
      budgetPerMonth = json["budgetPerMonth"].toDouble(),
      isAdmin = json["isAdmin"],
      created = DateTime.parse(json["created"]),
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "departmentId": departmentId,
    "uses": uses,
    "maxUses": maxUses,
    "code": code,
    "askForInventoryAfterFirstLogin": askForInventoryAfterFirstLogin,
    "isAdmin": isAdmin,
    "created": created.toIso8601String(),
    "initialBudget": initialBudget,
    "budgetPerMonth": budgetPerMonth,
  };

  @override
  Code fromJson(Map<String, dynamic> json) => Code.fromJson(json);

  @override
  String className() => "Code";
}
