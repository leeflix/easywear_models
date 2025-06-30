import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class SupplierConfig {
  Set<DomainId> customerDomainIds;
  Map<DomainId, Set<WorkwearId>> domainIdToWorkwearIds;
  String? returnPolicyUrl;
  String? supportEmail;
  String? supportPhone;

  SupplierConfig({
    required this.customerDomainIds,
    required this.domainIdToWorkwearIds,
    required this.returnPolicyUrl,
    required this.supportEmail,
    required this.supportPhone,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "domainIdToWorkwearIds": domainIdToWorkwearIds.map((key, value) => MapEntry(key, value.toList())),
        "returnPolicyUrl": returnPolicyUrl,
        "supportEmail": supportEmail,
        "supportPhone": supportPhone,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<DomainId>.from(json["customerDomainIds"]),
        domainIdToWorkwearIds = (json["domainIdToWorkwearIds"] as Map).map(
          (key, value) => MapEntry(key, Set<WorkwearId>.from(value)),
        ),
        returnPolicyUrl = json["returnPolicyUrl"],
        supportEmail = json["supportEmail"],
        supportPhone = json["supportPhone"];

  @override
  String toString() => jsonEncode(this);
}
