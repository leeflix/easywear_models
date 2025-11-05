import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class SupplierConfig {
  Set<Id<Domain>> customerDomainIds;
  Map<Id<Domain>, Set<Id<Workwear>>> domainIdToWorkwearIds;
  String? returnPolicyUrl;
  String? supportEmail;
  String? supportPhone;
  String? returnUrl;
  String? agbUrl;

  /// If true, this supplier's products will be hidden from the public supplier shop.
  /// This allows temporarily hiding all products without deleting them.
  bool? hideFromSupplierShop;

  SupplierConfig({
    required this.customerDomainIds,
    required this.domainIdToWorkwearIds,
    required this.returnPolicyUrl,
    required this.supportEmail,
    required this.supportPhone,
    required this.returnUrl,
    required this.agbUrl,
    this.hideFromSupplierShop,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "domainIdToWorkwearIds": domainIdToWorkwearIds.map((key, value) => MapEntry(key, value.toList())),
        "returnPolicyUrl": returnPolicyUrl,
        "supportEmail": supportEmail,
        "supportPhone": supportPhone,
        "returnUrl": returnUrl,
        "agbUrl": agbUrl,
        "hideFromSupplierShop": hideFromSupplierShop,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<Id<Domain>>.from(json["customerDomainIds"]),
        domainIdToWorkwearIds = (json["domainIdToWorkwearIds"] as Map).map(
          (key, value) => MapEntry(key, Set<Id<Workwear>>.from(value)),
        ),
        returnPolicyUrl = json["returnPolicyUrl"],
        supportEmail = json["supportEmail"],
        supportPhone = json["supportPhone"],
        returnUrl = json["returnUrl"],
        agbUrl = json["agbUrl"],
        hideFromSupplierShop = json["hideFromSupplierShop"];

  @override
  String toString() => jsonEncode(this);
}
