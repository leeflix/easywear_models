import 'package:easywear_models/easywear_models.dart';

class Correction extends Request {
  Inventory inventory;

  Correction({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.inventory,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Correction.fromJson(Map<String, dynamic> json)
      : inventory = Inventory.fromJson(json["inventory"]),
        super(
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
          userId: json["userId"],
          status: RequestStatusExt.fromString(json["status"]),
          adminMessage: json["adminMessage"],
          userMessage: json["userMessage"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "type": "correction",
        "inventory": inventory.toJson(),
        ...super.toJson(),
      };

  @override
  Request fromJson(Map<String, dynamic> json) => Correction.fromJson(json);

  @override
  String className() => "Correction";
}
