import 'dart:async';
import 'dart:convert';

import 'address.dart';
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

  Future<void> iterate(
    FutureOr<void> Function(
      String workwearId,
      String sku,
      PackageEntry packageEntry,
    ) fn,
  ) async {
    for (var workwearId in workwearIdToSkuToPackageEntry.keys) {
      for (var sku in workwearIdToSkuToPackageEntry[workwearId]!.keys) {
        var packageEntry = workwearIdToSkuToPackageEntry[workwearId]![sku]!;
        await fn(workwearId, sku, packageEntry);
      }
    }
  }
}
