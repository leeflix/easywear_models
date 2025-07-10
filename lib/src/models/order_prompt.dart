import 'package:easywear_models/easywear_models.dart';

class OrderPrompt extends DataClass<OrderPrompt> {
  StarterKitId starterKitName;
  Id<Domain> supplierDomainId;

  OrderPrompt({
    required this.starterKitName,
    required this.supplierDomainId,
  });

  OrderPrompt.fromJson(Map<String, dynamic> json)
      : starterKitName = json["starterKitName"],
        supplierDomainId = json["supplierDomainId"];

  Map<String, dynamic> toJson() => {
        "starterKitName": starterKitName,
        "supplierDomainId": supplierDomainId,
      };

  @override
  OrderPrompt fromJson(Map<String, dynamic> json) => OrderPrompt.fromJson(json);
}
