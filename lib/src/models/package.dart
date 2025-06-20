import 'dart:async';
import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class Package {
  Address? address;
  Map<String, Map<String, Map<bool, PackageEntry>>>
      workwearIdToSkuToUserPaysToPackageEntry;

  Package({
    required this.address,
    required this.workwearIdToSkuToUserPaysToPackageEntry,
  });

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "workwearIdToSkuToUserPaysToPackageEntry":
            workwearIdToSkuToUserPaysToPackageEntry.map(
          (workwearId, skuToUserPaysToPackageEntry) => MapEntry(
            workwearId,
            skuToUserPaysToPackageEntry.map(
              (sku, userPaysToPackageEntry) => MapEntry(
                sku,
                userPaysToPackageEntry.map(
                  (userPays, packageEntry) => MapEntry(
                    userPays,
                    packageEntry.toJson(),
                  ),
                ),
              ),
            ),
          ),
        ),
      };

  Package.fromJson(Map<String, dynamic> json)
      : address =
            json["address"] == null ? null : Address.fromJson(json["address"]),
        workwearIdToSkuToUserPaysToPackageEntry =
            Map.from(json["workwearIdToSkuToUserPaysToPackageEntry"]).map(
          (workwearId, skuToUserPaysToPackageEntry) => MapEntry(
            workwearId,
            Map.from(skuToUserPaysToPackageEntry).map(
              (sku, userPaysToPackageEntry) => MapEntry(
                sku,
                Map.from(userPaysToPackageEntry).map(
                  (userPays, packageEntry) =>
                      MapEntry(userPays, PackageEntry.fromJson(packageEntry)),
                ),
              ),
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
    for (var workwearId in workwearIdToSkuToUserPaysToPackageEntry.keys) {
      for (var sku
          in workwearIdToSkuToUserPaysToPackageEntry[workwearId]!.keys) {
        for (var userPays
            in workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]!
                .keys) {
          res.add(
            fn(
              workwearId,
              sku,
              workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]![
                  userPays]!,
            ),
          );
        }
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
    for (var workwearId in workwearIdToSkuToUserPaysToPackageEntry.keys) {
      for (var sku
          in workwearIdToSkuToUserPaysToPackageEntry[workwearId]!.keys) {
        for (var userPays
            in workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]!
                .keys) {
          res.add(
            await fn(
              workwearId,
              sku,
              workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]![
                  userPays]!,
            ),
          );
        }
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
    for (var workwearId in workwearIdToSkuToUserPaysToPackageEntry.keys) {
      for (var sku
          in workwearIdToSkuToUserPaysToPackageEntry[workwearId]!.keys) {
        for (var userPays
            in workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]!
                .keys) {
          res.add(
            fn(
              workwearId,
              sku,
              workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]![
                  userPays]!,
            ),
          );
        }
      }
    }
    return res;
  }
}
