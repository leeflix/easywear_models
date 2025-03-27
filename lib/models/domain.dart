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
  Set<String> aliases;
  EasyType type;
  SupplierConfig? supplierConfig;
  WhiteLabel whiteLabelData;
  DateTime? registered;
  DateTime? verified;
  int licensesQuantity;
  FeatureLevel featureLevel;
  DateTime? premiumTrialStartDate;
  Features features;
  String currency;
  bool useCurrencyForBudget;
  String delimiter;
  Intratool? intratool;
  String? beekeeperAccessToken;
  Map<String, double?> shop;

  Domain({
    required super.created,
    required super.updated,
    required super.isArchived,
    required this.domain,
    required this.tenant,
    required this.aliases,
    required this.type,
    required this.supplierConfig,
    required this.whiteLabelData,
    required this.registered,
    required this.verified,
    required this.licensesQuantity,
    required this.featureLevel,
    required this.premiumTrialStartDate,
    required this.features,
    required this.currency,
    required this.useCurrencyForBudget,
    required this.delimiter,
    required this.intratool,
    required this.beekeeperAccessToken,
    required this.shop,
  }) : super(id: domain);

  Domain.fromJson(Map<String, dynamic> json)
      : domain = json["domain"],
        tenant = json["tenant"],
        aliases = Set<String>.from(json["aliases"]),
        type = EasyTypeExt.fromString(json["type"]),
        supplierConfig = json["supplierConfig"] == null
            ? null
            : SupplierConfig.fromJson(json["supplierConfig"]),
        whiteLabelData = WhiteLabel.fromJson(json["whiteLabelData"]),
        registered = json["registered"] == null
            ? null
            : DateTime.parse(json["registered"]),
        verified =
            json["verified"] == null ? null : DateTime.parse(json["verified"]),
        licensesQuantity = json["licensesQuantity"],
        featureLevel = FeatureLevelExt.fromString(json["featureLevel"]),
        premiumTrialStartDate = json["premiumTrialStartDate"] == null
            ? null
            : DateTime.parse(json["premiumTrialStartDate"]),
        features = Features.fromJson(json["features"]),
        currency = json["currency"],
        useCurrencyForBudget = json["useCurrencyForBudget"],
        delimiter = json["delimiter"],
        intratool = json["intratool"] == null
            ? null
            : Intratool.fromJson(json["intratool"]),
        beekeeperAccessToken = json["beekeeperAccessToken"],
        shop = Map<String, double?>.from(json["shop"])
            .map((key, value) => MapEntry(key, value?.toDouble())),
        super(
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "domain": domain,
        "tenant": tenant,
        "aliases": aliases.toList(),
        "type": type.string,
        "supplierConfig": supplierConfig?.toJson(),
        "whiteLabelData": whiteLabelData.toJson(),
        "registered": registered?.toIso8601String(),
        "verified": verified?.toIso8601String(),
        "licensesQuantity": licensesQuantity,
        "featureLevel": featureLevel.string,
        "premiumTrialStartDate": premiumTrialStartDate?.toIso8601String(),
        "features": features.toJson(),
        "currency": currency,
        "useCurrencyForBudget": useCurrencyForBudget,
        "delimiter": delimiter,
        "intratool": intratool?.toJson(),
        "beekeeperAccessToken": beekeeperAccessToken,
        "shop": shop,
        ...super.toJson(),
      };

  @override
  Domain fromJson(Map<String, dynamic> json) => Domain.fromJson(json);

  @override
  String className() => "Domain";
}
