import 'dart:async';

import 'package:collection/collection.dart';
import 'package:easywear_models/easywear_models.dart';

sealed class Request extends Model<Request> {
  Id<User> userId;
  DateTime? requested;
  DateTime? canceled;
  String? cancelReason;
  RequestStatus status;
  String? adminMessage;
  String? userMessage;

  Request({
    required super.domainId,
    Id<Request>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.userId,
    required this.requested,
    required this.canceled,
    required this.cancelReason,
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
        "requested": requested?.toIso8601String(),
        "canceled": canceled?.toIso8601String(),
        "cancelReason": cancelReason,
        "created": created.toIso8601String(),
        "status": status.string,
        "adminMessage": adminMessage,
        "userMessage": userMessage,
        ...super.toJson(),
      };

  static Request fromJson2(Map<String, dynamic> json) => switch (RequestType.fromString(json["type"])) {
        RequestType.order => Order.fromJson(json),
        RequestType.claim => Claim.fromJson(json),
        RequestType.correction => Correction.fromJson(json),
      };

  RequestType get type => switch (this) {
        Claim _ => RequestType.claim,
        Order _ => RequestType.order,
        Correction _ => RequestType.correction,
      };

  Set<Id<Workwear>> readWorkwearIds();

  Inventory readInventory();
}

class Order extends Request {
  Id<Domain> supplierDomainId;
  List<Package> packages;
  Set<Id<Request>> sourceOrderIds;
  ViewMode view;

  Order({
    required super.domainId,
    Id<Request>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.supplierDomainId,
    required super.userId,
    required super.requested,
    required super.canceled,
    required super.cancelReason,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required this.packages,
    required this.sourceOrderIds,
    required this.view,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Order.fromJson(Map<String, dynamic> json)
      : packages = json["packages"].map<Package>((package) => Package.fromJson(package)).toList(),
        supplierDomainId = json["supplierDomainId"],
        sourceOrderIds = Set<Id<Request>>.from(json["sourceOrderIds"]),
        view = ViewMode.fromString(json["view"]),
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
          userId: json["userId"],
          requested: json["requested"] == null ? null : DateTime.parse(json["requested"]),
          canceled: json["canceled"] == null ? null : DateTime.parse(json["canceled"]),
          cancelReason: json["cancelReason"],
          status: RequestStatus.fromString(json["status"]),
          adminMessage: json["adminMessage"],
          userMessage: json["userMessage"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "type": "order",
        "supplierDomainId": supplierDomainId,
        "packages": packages.map((package) => package.toJson()).toList(),
        "sourceOrderIds": sourceOrderIds.toList(),
        "view": view.string,
        ...super.toJson(),
      };

  @override
  Request fromJson(Map<String, dynamic> json) => Order.fromJson(json);

  @override
  Set<Id<Workwear>> readWorkwearIds() => packages.map((package) => package.workwearIdToSkuToUserPaysToPackageEntry.keys).flattened.toSet();

  void iterateSync(
    void Function(
      int packageIndex,
      Id<Workwear> workwearId,
      ArticleId sku,
      PackageEntry packageEntry,
    ) fn,
  ) {
    for (var e in packages.asMap().entries) {
      var packageIndex = e.key;
      var package = e.value;
      package.iterateSync(
        (workwearId, sku, packageEntry) => fn(
          packageIndex,
          workwearId,
          sku,
          packageEntry,
        ),
      );
    }
  }

  Future<void> iterateAsync(
    Future<void> Function(
      int packageIndex,
      Id<Workwear> workwearId,
      ArticleId sku,
      PackageEntry packageEntry,
    ) fn,
  ) async {
    for (var e in packages.asMap().entries) {
      var packageIndex = e.key;
      var package = e.value;
      await package.iterateAsync(
        (workwearId, sku, packageEntry) => fn(
          packageIndex,
          workwearId,
          sku,
          packageEntry,
        ),
      );
    }
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
      (packageIndex, workwearId, sku, packageEntry) => cost += packageEntry.amount * (packageEntry.cost ?? 0),
    );
    return cost;
  }
}

class Correction extends Request {
  Inventory inventory;

  Correction({
    required super.domainId,
    Id<Request>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required super.userId,
    required super.requested,
    required super.canceled,
    required super.cancelReason,
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
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
          userId: json["userId"],
          requested: json["requested"] == null ? null : DateTime.parse(json["requested"]),
          canceled: json["canceled"] == null ? null : DateTime.parse(json["canceled"]),
          cancelReason: json["cancelReason"],
          status: RequestStatus.fromString(json["status"]),
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
  Set<Id<Workwear>> readWorkwearIds() => inventory.workwearIds();

  @override
  Inventory readInventory() => inventory;
}

class Claim extends Order {
  bool userInventory;
  Set<ImageId> imageIds;

  Claim({
    required super.domainId,
    Id<Request>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required super.supplierDomainId,
    required super.userId,
    required super.requested,
    required super.canceled,
    required super.cancelReason,
    required super.status,
    required super.adminMessage,
    required super.userMessage,
    required super.packages,
    required super.sourceOrderIds,
    required super.view,
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
        imageIds = Set<ImageId>.from(json["imageIds"]),
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
}
