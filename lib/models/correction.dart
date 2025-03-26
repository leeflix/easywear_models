import 'inventory_entry.dart';
import 'request.dart';
import 'request_status.dart';

class Correction extends Request {
  List<InventoryEntry> inventoryEntries;

  Correction({
    required super.id,
    required super.created,
    required super.updated,
    required super.isArchived,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.inventoryEntries,
  });

  Correction.fromJson(Map<String, dynamic> json)
      : inventoryEntries = List<InventoryEntry>.from(json["inventoryEntries"]
            .map((inventoryEntry) => InventoryEntry.fromJson(inventoryEntry))),
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
        "inventoryEntries": inventoryEntries
            .map((inventoryEntry) => inventoryEntry.toJson())
            .toList(),
        ...super.toJson(),
      };

  @override
  Request fromJson(Map<String, dynamic> json) => Correction.fromJson(json);

  @override
  String className() => "Correction";
}
