import 'dart:async';

import 'package:collection/collection.dart';
import 'package:easywear_models/easywear_models.dart';
import 'package:easywear_models/models/package.dart';

import 'package_entry.dart';

class Order extends Request {
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
            .map<Package>((package) => Package.fromJson(package)),
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
        "packages": packages.map((package) => package.toJson()),
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

  Stream<T> iterate<T>(
    FutureOr<T> Function(
      String workwearId,
      String sku,
      PackageEntry packageEntry,
    ) fn,
  ) async* {
    for (var package in packages) {
      await for (var res in package.iterate(fn)) {
        yield res;
      }
    }
  }

  Inventory readInventory() {
    Inventory inventory = Inventory.empty();
    iterate(
      (workwearId, sku, packageEntry) => inventory.updateAmountInInventory(
        workwearId: workwearId,
        sku: sku,
        amount: packageEntry.amount,
      ),
    );
    return inventory;
  }
}
