import 'dart:convert';

class SupplierConfig {
  Set<String> customerDomainIds;
  String? returnPolicyUrl;

  SupplierConfig({
    required this.customerDomainIds,
    required this.returnPolicyUrl,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "returnPolicyUrl": returnPolicyUrl,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<String>.from(json["customerDomainIds"]),
        returnPolicyUrl = json["returnPolicyUrl"];

  @override
  String toString() => jsonEncode(this);
}
