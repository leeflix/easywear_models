import 'dart:async';
import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

import 'address.dart';
import 'inventory.dart';
import 'package_entry.dart';

class Package {
  Address? address;
  Map<String, Map<String, PackageEntry>> workwearIdToSkuToPackageEntry;

  Package({
    required this.address,
    required this.workwearIdToSkuToPackageEntry,
  });

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "workwearIdToSkuToPackageEntry": workwearIdToSkuToPackageEntry.map(
          (workwearId, skuToPackageEntry) => MapEntry(
            workwearId,
            skuToPackageEntry.map(
              (sku, packageEntry) => MapEntry(sku, packageEntry.toJson()),
            ),
          ),
        ),
      };

  Package.fromJson(Map<String, dynamic> json)
      : address =
            json["address"] == null ? null : Address.fromJson(json["address"]),
        workwearIdToSkuToPackageEntry =
            Map.from(json["workwearIdToSkuToPackageEntry"]).map(
          (workwearId, skuToPackageEntry) => MapEntry(
            workwearId,
            Map<String, Map<String, dynamic>>.from(skuToPackageEntry).map(
              (sku, packageEntry) =>
                  MapEntry(sku, PackageEntry.fromJson(packageEntry)),
            ),
          ),
        );

  @override
  String toString() => jsonEncode(this);

  List<T> iterateSync<T>(
    T Function(
      String workwearId,
      String sku,
      PackageEntry packageEntry,
    ) fn,
  ) {
    List<T> res = [];
    for (var workwearId in workwearIdToSkuToPackageEntry.keys) {
      for (var sku in workwearIdToSkuToPackageEntry[workwearId]!.keys) {
        res.add(
          fn(
            workwearId,
            sku,
            workwearIdToSkuToPackageEntry[workwearId]![sku]!,
          ),
        );
      }
    }
    return res;
  }

  FutureOr<List<T>> iterateAsync<T>(
    FutureOr<T> Function(
      String workwearId,
      String sku,
      PackageEntry packageEntry,
    ) fn,
  ) async {
    List<T> res = [];
    for (var workwearId in workwearIdToSkuToPackageEntry.keys) {
      for (var sku in workwearIdToSkuToPackageEntry[workwearId]!.keys) {
        res.add(
          await fn(
            workwearId,
            sku,
            workwearIdToSkuToPackageEntry[workwearId]![sku]!,
          ),
        );
      }
    }
    return res;
  }

  Inventory readInventory() {
    Inventory inventory = Inventory.empty();
    iterateSync(
      (workwearId, sku, packageEntry) => inventory.updateAmountInInventory(
        workwearId: workwearId,
        sku: sku,
        amount: packageEntry.amount,
      ),
    );
    return inventory;
  }

  List<T> mapSync<T>(
    T Function(
      String workwearId,
      String sku,
      PackageEntry packageEntry,
    ) fn,
  ) {
    List<T> res = [];
    for (var workwearId in workwearIdToSkuToPackageEntry.keys) {
      for (var sku in workwearIdToSkuToPackageEntry[workwearId]!.keys) {
        res.add(
          fn(
            workwearId,
            sku,
            workwearIdToSkuToPackageEntry[workwearId]![sku]!,
          ),
        );
      }
    }
    return res;
  }
}
