class SupplierConfig {
  String? returnPolicyUrl;

  SupplierConfig({this.returnPolicyUrl});

  Map<String, dynamic> toJson() => {"returnPolicyUrl": returnPolicyUrl};

  SupplierConfig.fromJson(Map<String, dynamic> json)
    : returnPolicyUrl = json["returnPolicyUrl"];
}
