import 'package:easywear_models/easywear_models.dart';

class ShippingMethod extends DataClass<ShippingMethod> {
  String name;
  double parcelPrice;
  double surchargePricePerKg;
  MinMax? deliveryTimeInDays;
  ShippingMethod? remoteAreaAdjustments;

  ShippingMethod({
    required this.name,
    required this.parcelPrice,
    required this.surchargePricePerKg,
    required this.deliveryTimeInDays,
    this.remoteAreaAdjustments,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "parcelPrice": parcelPrice,
        "surchargePricePerKg": surchargePricePerKg,
        "deliveryTimeInDays": deliveryTimeInDays?.toJson(),
        "remoteAreaAdjustments": remoteAreaAdjustments?.toJson(),
      };

  ShippingMethod.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        parcelPrice = json["parcelPrice"],
        surchargePricePerKg = json["surchargePricePerKg"],
        deliveryTimeInDays = json["deliveryTimeInDays"] != null ? MinMax.fromJson(json["deliveryTimeInDays"]) : null,
        remoteAreaAdjustments = json["remoteAreaAdjustments"] != null ? ShippingMethod.fromJson(json["remoteAreaAdjustments"]) : null;

  @override
  ShippingMethod fromJson(Map<String, dynamic> json) => ShippingMethod.fromJson(json);

  String getName({required bool? isRemoteArea}) {
    if (isRemoteArea == true && remoteAreaAdjustments != null) {
      return remoteAreaAdjustments!.name;
    }
    return name;
  }

  double getParcelPrice({required bool? isRemoteArea}) {
    if (isRemoteArea == true && remoteAreaAdjustments != null) {
      return remoteAreaAdjustments!.parcelPrice;
    }
    return parcelPrice;
  }

  double getSurchargePricePerKg({required bool? isRemoteArea}) {
    if (isRemoteArea == true && remoteAreaAdjustments != null) {
      return remoteAreaAdjustments!.surchargePricePerKg;
    }
    return surchargePricePerKg;
  }

  MinMax? getDeliveryTimeInDays({required bool? isRemoteArea}) {
    if (isRemoteArea == true && remoteAreaAdjustments != null && remoteAreaAdjustments!.deliveryTimeInDays != null) {
      return remoteAreaAdjustments!.deliveryTimeInDays!;
    }
    return deliveryTimeInDays;
  }
}
