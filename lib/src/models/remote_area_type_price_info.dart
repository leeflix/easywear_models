import 'package:easywear_models/easywear_models.dart';

class RemoteAreaTypePriceInfo extends DataClass<RemoteAreaTypePriceInfo> {
  double price;
  double pricePerKg;
  double minPrice;

  RemoteAreaTypePriceInfo({
    required this.price,
    required this.pricePerKg,
    required this.minPrice,
  });

  Map<String, dynamic> toJson() => {
        "price": price,
        "pricePerKg": pricePerKg,
        "minPrice": minPrice,
      };

  RemoteAreaTypePriceInfo.fromJson(Map<String, dynamic> json)
      : price = json["price"],
        pricePerKg = json["pricePerKg"],
        minPrice = json["minPrice"];

  @override
  RemoteAreaTypePriceInfo fromJson(Map<String, dynamic> json) => RemoteAreaTypePriceInfo.fromJson(json);
}
