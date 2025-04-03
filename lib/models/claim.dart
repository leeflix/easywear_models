import 'order.dart';
import 'request.dart';

base class Claim extends Order {
  bool userInventory;
  Set<String> imageIds;

  Claim({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required super.packages,
    required this.userInventory,
    required this.imageIds,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Claim.fromJson(Map<String, dynamic> json)
      : userInventory = json["userInventory"],
        imageIds = Set<String>.from(json["imageIds"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        "type": "claim",
        "userInventory": userInventory,
        "imageIds": imageIds.toList(),
        ...super.toJson(),
      };

  @override
  Request fromJson(Map<String, dynamic> json) => Claim.fromJson(json);

  @override
  String className() => "Claim";
}
