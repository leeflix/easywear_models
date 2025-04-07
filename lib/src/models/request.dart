import 'dart:async';

import 'package:collection/collection.dart';

import 'inventory.dart';
import 'model.dart';
import 'package.dart';
import 'package_entry.dart';
import 'request_status.dart';
import 'request_type.dart';

sealed class Request extends Model<Request> {
  String userId;
  RequestStatus status;
  String? adminMessage;
  String? userMessage;

  Request({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.userId,
    required this.status,
    required this.adminMessage,
    required this.userMessage,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "status": status.string,
        "adminMessage": adminMessage,
        "userMessage": userMessage,
        ...super.toJson(),
      };

  static Request fromJson2(Map<String, dynamic> json) =>
      switch (RequestTypeE.fromString(json["type"])) {
        RequestType.order => Order.fromJson(json),
        RequestType.claim => Claim.fromJson(json),
        RequestType.correction => Correction.fromJson(json),
      };

  RequestType get type => switch (this) {
        Claim _ => RequestType.claim,
        Order _ => RequestType.order,
        Correction _ => RequestType.correction,
      };

  Set<String> workwearIds();
}

class Order extends Request {
  String? supplierDomainId;
  List<Package> packages;

  Order({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required super.userId,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.packages,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Order.fromJson(Map<String, dynamic> json)
      : packages = json["packages"]
            .map<Package>((package) => Package.fromJson(package))
            .toList(),
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
        "type": "order",
        "packages": packages.map((package) => package.toJson()).toList(),
        ...super.toJson(),
      };

  @override
  Request fromJson(Map<String, dynamic> json) => Order.fromJson(json);

  @override
  String className() => "Order";

  Set<String> workwearIds() => packages
      .map((package) => package.workwearIdToSkuToPackageEntry.keys)
      .flattened
      .toSet();

  List<T> iterateSync<T>(T Function(
      int packageIndex,
      String workwearId,
      String sku,
      PackageEntry packageEntry,
      ) fn,) {
    List<T> res = [];
    int pacakgeIndex = 0;
    for (var package in packages) {
      res.addAll(
        package.iterateSync(
              (workwearId, sku, packageEntry) =>
              fn(
                pacakgeIndex,
                workwearId,
                sku,
                packageEntry,
              ),
        ),
      );
      pacakgeIndex += 1;
    }
    return res;
  }

  FutureOr<List<T>> iterateAsync<T>(
    FutureOr<T> Function(
        int packageIndex,
      String workwearId,
      String sku,
      PackageEntry packageEntry,
    ) fn,
  ) async {
    List<T> res = [];
    int pacakgeIndex = 0;
    for (var package in packages) {
      res.addAll(
        await package.iterateAsync(
          (workwearId, sku, packageEntry) => fn(
            pacakgeIndex,
            workwearId,
            sku,
            packageEntry,
          ),
        ),
      );
      pacakgeIndex += 1;
    }
    return res;
  }

  Inventory readInventory() {
    Inventory inventory = Inventory.empty();
    iterateSync(
      (packageIndex, workwearId, sku, packageEntry) => inventory.updateAmountInInventory(
        workwearId: workwearId,
        sku: sku,
        amount: packageEntry.amount,
      ),
    );
    return inventory;
  }

  double cost() {
    double cost = 0;
    iterateSync(
      (packageIndex, workwearId, sku, packageEntry) =>
          cost += packageEntry.amount * (packageEntry.cost ?? 0),
    );
    return cost;
  }
}

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

  @override
  Set<String> workwearIds() => inventory.workwearIds();
}

class Claim extends Order {
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
