import 'dart:async';
import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class Package {
  Address? address;
  Map<Id<Workwear>, Map<ArticleId, Map<bool?, PackageEntry>>>
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
                    userPays.toString(),
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
                  (userPays, packageEntry) => MapEntry(
                      userPays == "null" ? null : bool.parse(userPays),
                      PackageEntry.fromJson(packageEntry)),
                ),
              ),
            ),
          ),
        );

  @override
  String toString() => jsonEncode(this);

  void iterateSync(
    void Function(
        Id<Workwear> workwearId,
      ArticleId sku,
      PackageEntry packageEntry,
    ) fn,
  ) {
    for (var workwearId in workwearIdToSkuToUserPaysToPackageEntry.keys) {
      for (var sku
          in workwearIdToSkuToUserPaysToPackageEntry[workwearId]!.keys) {
        for (var userPays
            in workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]!
                .keys) {
          fn(
            workwearId,
            sku,
            workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]![
                userPays]!,
          );
        }
      }
    }
  }

  Future<void> iterateAsync(
    Future<void> Function(
        Id<Workwear> workwearId,
      ArticleId sku,
      PackageEntry packageEntry,
    ) fn,
  ) async {
    for (var workwearId in workwearIdToSkuToUserPaysToPackageEntry.keys) {
      for (var sku
          in workwearIdToSkuToUserPaysToPackageEntry[workwearId]!.keys) {
        for (var userPays
            in workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]!
                .keys) {
          await fn(
            workwearId,
            sku,
            workwearIdToSkuToUserPaysToPackageEntry[workwearId]![sku]![
                userPays]!,
          );
        }
      }
    }
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
        Id<Workwear> workwearId,
      ArticleId sku,
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
