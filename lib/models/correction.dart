import 'inventory_entry.dart';
import 'request.dart';
import 'request_status.dart';

class Correction extends Request {
  List<InventoryEntry> inventoryEntries;

  Correction({
    required super.id,
    required super.created,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.inventoryEntries,
  });

  Correction.fromJson(Map<String, dynamic> json)
    : inventoryEntries = List<InventoryEntry>.from(
        json["inventoryEntries"].map(
          (inventoryEntry) => InventoryEntry.fromJson(inventoryEntry),
        ),
      ),
      super(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        userId: json["userId"],
        status: RequestStatusE.fromString(json["status"]),
        adminMessage: json["adminMessage"],
        userMessage: json["userMessage"],
      );

  @override
  Map<String, dynamic> toJson() => {
    "type": "correction",
    "id": id,
    "created": created.toIso8601String(),
    "userId": userId,
    "status": status.string,
    "adminMessage": adminMessage,
    "userMessage": userMessage,
    "inventoryEntries":
        inventoryEntries
            .map((inventoryEntry) => inventoryEntry.toJson())
            .toList(),
  };

  @override
  Request fromJson(Map<String, dynamic> json) => Correction.fromJson(json);
}
