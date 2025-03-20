import 'easy_type.dart';
import 'feature_level.dart';
import 'features.dart';
import 'intratool.dart';
import 'model.dart';
import 'supplier_config.dart';
import 'white_label.dart';

class Domain extends Model<Domain> {
  String domain;
  String tenant;
  Set<String> adminUserIds;
  int licensesQuantity;
  DateTime? registered;
  DateTime? premiumTrialStartDate;
  FeatureLevel featureLevel;
  DateTime? verified;
  WhiteLabel whiteLabelData;
  String currency;
  bool useCurrencyForBudget;
  Intratool? intratool;
  Features features;
  String delimiter;
  EasyType type;
  Set<String> aliases;
  SupplierConfig? supplierConfig;
  String? beekeeperAccessToken;

  Domain({
    required this.domain,
    required this.tenant,
    required this.licensesQuantity,
    required this.registered,
    required this.featureLevel,
    required this.premiumTrialStartDate,
    required this.whiteLabelData,
    required this.currency,
    required this.useCurrencyForBudget,
    required this.verified,
    required this.intratool,
    required this.features,
    required this.delimiter,
    required this.type,
    required this.aliases,
    required this.supplierConfig,
    required this.adminUserIds,
    required this.beekeeperAccessToken,
  }) : super(id: "0");

  Domain.fromJson(Map<String, dynamic> json)
    : domain = json["domain"],
      tenant = json["tenant"],
      licensesQuantity = json["licensesQuantity"],
      registered =
          json["registered"] == null
              ? null
              : DateTime.parse(json["registered"]),
      premiumTrialStartDate =
          json["premiumTrialStartDate"] == null
              ? null
              : DateTime.parse(json["premiumTrialStartDate"]),
      featureLevel = FeatureLevelExtension.fromString(json["featureLevel"]),
      whiteLabelData = WhiteLabel.fromJson(json["whiteLabelData"]),
      currency = json["currency"],
      useCurrencyForBudget = json["useCurrencyForBudget"],
      verified =
          json["verified"] == null ? null : DateTime.parse(json["verified"]),
      intratool =
          json["intratool"] == null
              ? null
              : Intratool.fromJson(json["intratool"]),
      features = Features.fromJson(json["features"]),
      delimiter = json["delimiter"],
      type = EasyTypeE.fromString(json["type"]),
      aliases = Set<String>.from(json["aliases"]),
      supplierConfig =
          json["supplierConfig"] == null
              ? null
              : SupplierConfig.fromJson(json["supplierConfig"]),
      adminUserIds = Set<String>.from(json["adminUserIds"]),
      beekeeperAccessToken = json["beekeeperAccessToken"],
      super(id: json["id"]);

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "domain": domain,
    "tenant": tenant,
    "licensesQuantity": licensesQuantity,
    "registered": registered?.toIso8601String(),
    "premiumTrialStartDate": premiumTrialStartDate?.toIso8601String(),
    "featureLevel": featureLevel.string(),
    "whiteLabelData": whiteLabelData.toJson(),
    "currency": currency,
    "useCurrencyForBudget": useCurrencyForBudget,
    "verified": verified?.toIso8601String(),
    "intratool": intratool?.toJson(),
    "features": features.toJson(),
    "type": type.string,
    "delimiter": delimiter,
    "aliases": aliases.toList(),
    "supplierConfig": supplierConfig?.toJson(),
    "adminUserIds": adminUserIds.toList(),
    "beekeeperAccessToken": beekeeperAccessToken,
  };

  @override
  Domain fromJson(Map<String, dynamic> json) => Domain.fromJson(json);
}
