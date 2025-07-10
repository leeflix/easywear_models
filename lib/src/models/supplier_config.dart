import 'package:collection/collection.dart';
import 'package:easywear_models/easywear_models.dart';

class SupplierConfig extends DataClass<SupplierConfig> {
  Set<Id<Domain>> customerDomainIds;
  String? returnPolicyUrl;
  String? supportEmail;
  String? supportPhone;
  String? returnUrl;
  String? agbUrl;
  Map<int, Map<Country, ShippingMethod>> maxPackageWeightInKgToCountryToShippingMethod;
  Map<Country, Map<(String, String), RemoteAreaInfo>> countryToZipRangesToRemoteAreaInfo;
  Map<RemoteAreaType, RemoteAreaTypePriceInfo> remoteAreaTypeToPriceInfo;

  SupplierConfig({
    required this.customerDomainIds,
    required this.returnPolicyUrl,
    required this.supportEmail,
    required this.supportPhone,
    required this.returnUrl,
    required this.agbUrl,
    required this.maxPackageWeightInKgToCountryToShippingMethod,
    required this.countryToZipRangesToRemoteAreaInfo,
    required this.remoteAreaTypeToPriceInfo,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "returnPolicyUrl": returnPolicyUrl,
        "supportEmail": supportEmail,
        "supportPhone": supportPhone,
        "returnUrl": returnUrl,
        "agbUrl": agbUrl,
        "countryToZipsToRemoteAreaInfo": countryToZipRangesToRemoteAreaInfo.map(
          (country, zipRangesToRemoteAreaInfo) => MapEntry(
            country.string,
            zipRangesToRemoteAreaInfo.map(
              (zipRange, remoteAreaInfo) => MapEntry(
                "${zipRange.$1}-${zipRange.$2}",
                remoteAreaInfo.toJson(),
              ),
            ),
          ),
        ),
        "remoteAreaTypeToPriceInfo": remoteAreaTypeToPriceInfo.map(
          (type, priceInfo) => MapEntry(
            type.string,
            priceInfo.toJson(),
          ),
        ),
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<Id<Domain>>.from(json["customerDomainIds"]),
        returnPolicyUrl = json["returnPolicyUrl"],
        supportEmail = json["supportEmail"],
        supportPhone = json["supportPhone"],
        returnUrl = json["returnUrl"],
        agbUrl = json["agbUrl"],
        maxPackageWeightInKgToCountryToShippingMethod = (json["maxPackageWeightInKgToCountryToShippingMethod"] as Map).map((weight, countryToShippingMethod) => MapEntry(
              int.parse(weight),
              (countryToShippingMethod as Map).map(
                (country, shippingMethod) => MapEntry(
                  Country.fromString(country),
                  ShippingMethod.fromJson(shippingMethod),
                ),
              ),
            )),
        countryToZipRangesToRemoteAreaInfo = (json["countryToZipsToRemoteAreaInfo"] as Map).map((country, zipRangesToRemoteAreaInfo) => MapEntry(
              Country.fromString(country),
              (zipRangesToRemoteAreaInfo as Map).map((zipRange, remoteAreaInfo) => MapEntry(
                    (
                      zipRange.split('-')[0],
                      zipRange.split('-')[1],
                    ),
                    RemoteAreaInfo.fromJson(remoteAreaInfo),
                  )),
            )),
        remoteAreaTypeToPriceInfo = (json["remoteAreaTypeToPriceInfo"] as Map).map(
          (type, priceInfo) => MapEntry(
            RemoteAreaType.fromString(type),
            RemoteAreaTypePriceInfo.fromJson(priceInfo),
          ),
        );

  @override
  SupplierConfig fromJson(Map<String, dynamic> json) => SupplierConfig.fromJson(json);

  PackageDeliveryReport? getPackageDeliveryReport({
    required Country country,
    required String zipCode,
    required double weightInKg,
  }) {
    var bestPackageWeightInKg = getBestPackageWeightInKg(
      country: country,
      packageWeightInKg: weightInKg,
    );

    if (bestPackageWeightInKg == null) return null;

    var shippingMethod = maxPackageWeightInKgToCountryToShippingMethod[bestPackageWeightInKg]?[country];

    if (shippingMethod == null) return null;

    var remoteAreaInfo = getRemoteAreaInfo(country: country, zipCode: zipCode);
    var remoteAreaTypePriceInfo = remoteAreaInfo == null ? null : remoteAreaTypeToPriceInfo[remoteAreaInfo.type];

    return PackageDeliveryReport(
      maxPackageWeightInKg: bestPackageWeightInKg,
      country: country,
      zip: zipCode,
      packageWeight: weightInKg,
      shippingMethod: shippingMethod,
      remoteAreaInfo: remoteAreaInfo,
      remoteAreaPriceInfo: remoteAreaTypePriceInfo,
    );
  }

  bool? isZipRemoteArea({
    required Country country,
    required String zipCode,
  }) {
    var remoteAreaInfo = getRemoteAreaInfo(country: country, zipCode: zipCode);
    return remoteAreaInfo?.isRemoteArea;
  }

  RemoteAreaInfo? getRemoteAreaInfo({
    required Country country,
    required String zipCode,
  }) {
    var zipRangesToRemoteAreaInfo = countryToZipRangesToRemoteAreaInfo[country];
    if (zipRangesToRemoteAreaInfo == null) return null;

    for (var entry in zipRangesToRemoteAreaInfo.entries) {
      (String, String) zipRange = entry.key;
      RemoteAreaInfo remoteAreaInfo = entry.value;

      int? startZip = int.tryParse(zipRange.$1.replaceAll(" ", ""));
      int? endZip = int.tryParse(zipRange.$2.replaceAll(" ", ""));
      int? zip = int.tryParse(zipCode.replaceAll(" ", ""));
      if (startZip != null && endZip != null && zip != null) {
        if (zip >= startZip && zip <= endZip) {
          return remoteAreaInfo;
        }
      } else {
        if ({zipRange.$1, zipRange.$2}.contains(zipCode)) {
          return remoteAreaInfo;
        }
      }
    }

    return null;
  }

  RemoteAreaType? getRemoteAreaType({
    required Country country,
    required String zipCode,
  }) {
    var remoteAreaInfo = getRemoteAreaInfo(country: country, zipCode: zipCode);
    return remoteAreaInfo?.type;
  }

  ShippingMethod? getBestShippingMethod({
    required Country country,
    required double packageWeightInKg,
  }) {
    var bestWeight = getBestPackageWeightInKg(
      country: country,
      packageWeightInKg: packageWeightInKg,
    );
    if (bestWeight == null) return null;

    var shippingMethods = maxPackageWeightInKgToCountryToShippingMethod[bestWeight];
    if (shippingMethods == null) return null;

    return shippingMethods[country];
  }

  int? getBestPackageWeightInKg({
    required Country country,
    required double packageWeightInKg,
  }) =>
      maxPackageWeightInKgToCountryToShippingMethod.entries.where((entry) => entry.value.containsKey(country)).map((entry) => entry.key).firstWhereOrNull((weight) => weight >= packageWeightInKg);

  int? maxPackageWeightInKg({required Country country}) => maxPackageWeightInKgToCountryToShippingMethod.entries.where((entry) => entry.value.containsKey(country)).map((entry) => entry.key).max;
}
