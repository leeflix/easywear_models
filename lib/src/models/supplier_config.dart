import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class SupplierConfig {
  Set<Id<Domain>> customerDomainIds;
  Map<Id<Domain>, Set<Id<Workwear>>> domainIdToWorkwearIds;
  String? returnPolicyUrl;
  String? supportEmail;
  String? supportPhone;
  String? returnUrl;

  SupplierConfig({
    required this.customerDomainIds,
    required this.domainIdToWorkwearIds,
    required this.returnPolicyUrl,
    required this.supportEmail,
    required this.supportPhone,
    required this.returnUrl,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "domainIdToWorkwearIds": domainIdToWorkwearIds.map((key, value) => MapEntry(key, value.toList())),
        "returnPolicyUrl": returnPolicyUrl,
        "supportEmail": supportEmail,
        "supportPhone": supportPhone,
        "returnUrl": returnUrl,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<Id<Domain>>.from(json["customerDomainIds"]),
        domainIdToWorkwearIds = (json["domainIdToWorkwearIds"] as Map).map(
          (key, value) => MapEntry(key, Set<Id<Workwear>>.from(value)),
        ),
        returnPolicyUrl = json["returnPolicyUrl"],
        supportEmail = json["supportEmail"],
        supportPhone = json["supportPhone"],
        returnUrl = json["returnUrl"];

  @override
  String toString() => jsonEncode(this);
}
