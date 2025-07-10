import 'package:easywear_models/easywear_models.dart';
import 'package:easywear_models/src/models/shipping_method.dart';

class PackageDeliveryReport extends DataClass<PackageDeliveryReport> {
  int maxPackageWeightInKg;
  Country country;
  String zip;
  double packageWeight;
  ShippingMethod shippingMethod;
  RemoteAreaInfo? remoteAreaInfo;
  RemoteAreaTypePriceInfo? remoteAreaPriceInfo;

  PackageDeliveryReport({
    required this.maxPackageWeightInKg,
    required this.country,
    required this.zip,
    required this.packageWeight,
    required this.shippingMethod,
    required this.remoteAreaInfo,
    required this.remoteAreaPriceInfo,
  });

  PackageDeliveryReport.fromJson(Map<String, dynamic> json)
      : maxPackageWeightInKg = json["maxPackageWeightInKg"],
        country = Country.fromString(json["country"]),
        zip = json["zip"],
        packageWeight = json["packageWeight"],
        shippingMethod = ShippingMethod.fromJson(json["shippingMethod"]),
        remoteAreaInfo = json["remoteAreaInfo"] != null
            ? RemoteAreaInfo.fromJson(json["remoteAreaInfo"])
            : null,
        remoteAreaPriceInfo = json["remoteAreaPriceInfo"] != null
            ? RemoteAreaTypePriceInfo.fromJson(json["remoteAreaPriceInfo"])
            : null;

  Map<String, dynamic> toJson() => {
        "maxPackageWeightInKg": maxPackageWeightInKg,
        "country": country.string,
        "zip": zip,
        "packageWeight": packageWeight,
        "shippingMethod": shippingMethod.toJson(),
        "remoteAreaInfo": remoteAreaInfo?.toJson(),
        "remoteAreaPriceInfo": remoteAreaPriceInfo?.toJson(),
      };

  @override
  PackageDeliveryReport fromJson(Map<String, dynamic> json) =>
      PackageDeliveryReport.fromJson(json);

  double totalCost() {
    double totalCost = 0;
    bool? isRemoteArea = remoteAreaInfo?.isRemoteArea;
    totalCost += shippingMethod.getParcelPrice(isRemoteArea: isRemoteArea);
    totalCost += packageWeight * shippingMethod.getSurchargePricePerKg(isRemoteArea: isRemoteArea);
    // todo: add remote area price if applicable
    return totalCost;
  }
}
