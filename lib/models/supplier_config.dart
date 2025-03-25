class SupplierConfig {
  String? returnPolicyUrl;
  Set<String> customerDomainIds;

  SupplierConfig({
    required this.returnPolicyUrl,
    required this.customerDomainIds,
  });

  Map<String, dynamic> toJson() => {
    "returnPolicyUrl": returnPolicyUrl,
    "customerDomainIds": customerDomainIds.toList(),
  };

  SupplierConfig.fromJson(Map<String, dynamic> json)
    : customerDomainIds = Set<String>.from(json["customerDomainIds"]),
      returnPolicyUrl = json["returnPolicyUrl"];
}
