import 'dart:convert';

class SupplierConfig {
  Set<String> customerDomainIds;
  Map<String, Map<String, Map<String, double?>>> shops;
  String? returnPolicyUrl;

  SupplierConfig({
    required this.customerDomainIds,
    required this.shops,
    required this.returnPolicyUrl,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "shops": shops.map(
          (key, value) => MapEntry(
            key,
            value.map(
              (key, value) => MapEntry(
                key,
                value.map(
                  (key, value) => MapEntry(key, value),
                ),
              ),
            ),
          ),
        ),
        "returnPolicyUrl": returnPolicyUrl,
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<String>.from(json["customerDomainIds"]),
        shops = Map<String, Map<String, Map<String, double?>>>.from(json["shops"]),
        returnPolicyUrl = json["returnPolicyUrl"];

  @override
  String toString() => jsonEncode(this);
}
