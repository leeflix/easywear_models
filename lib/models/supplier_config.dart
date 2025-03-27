import 'dart:convert';

class SupplierConfig {
  Set<String> customerDomainIds;
  Map<String, Set<String>> shops;
  String? returnPolicyUrl;

  SupplierConfig({
    required this.customerDomainIds,
    required this.shops,
    required this.returnPolicyUrl,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "shops": shops.map((key, value) => MapEntry(key, value.toList())),
        "returnPolicyUrl": returnPolicyUrl,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<String>.from(json["customerDomainIds"]),
        shops = Map<String, Set<String>>.from(json["shops"]).map(
          (key, value) => MapEntry(key, Set<String>.from(value)),
        ),
        returnPolicyUrl = json["returnPolicyUrl"];

  @override
  String toString() => jsonEncode(this);
}
