import 'dart:convert';

class SupplierConfig {
  Set<String> customerDomainIds;
  Map<String, Set<String>> domainIdToWorkwearIds;
  String? returnPolicyUrl;

  SupplierConfig({
    required this.customerDomainIds,
    required this.domainIdToWorkwearIds,
    required this.returnPolicyUrl,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "domainIdToWorkwearIds": domainIdToWorkwearIds.map((key, value) => MapEntry(key, value.toList())),
        "returnPolicyUrl": returnPolicyUrl,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<String>.from(json["customerDomainIds"]),
        domainIdToWorkwearIds = (json["domainIdToWorkwearIds"] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, Set<String>.from(value)),
        ),
        returnPolicyUrl = json["returnPolicyUrl"];

  @override
  String toString() => jsonEncode(this);
}
