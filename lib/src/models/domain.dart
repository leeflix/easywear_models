import 'package:easywear_models/easywear_models.dart';

class Domain extends Model<Domain> {
  String? name;
  String? tenant;
  Set<Id<Domain>> aliases;
  EasyType type;
  SupplierConfig? supplierConfig;
  WhiteLabel whiteLabelData;
  DateTime? registered;
  DateTime? verified;
  int licensesQuantity;
  FeatureLevel featureLevel;
  DateTime? premiumTrialStartDate;
  Features features;
  Currency currency;
  bool useCurrencyForBudget;
  String delimiter;
  Intratool? intratool;
  Beekeeper? beekeeper;
  Map<Id<Workwear>, double?> shop;
  Map<StarterKitId, Map<Id<Workwear>, int>> starterKitNameToWorkwearIdToAmount;
  Inventory warehouse;
  bool defaultFromSupplier;
  bool? defaultUserPays;
  Set<Id<Domain>>? enabledSupplierIds;

  Domain({
    required super.domainId,
    Id<Domain>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
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
    required this.beekeeper,
    required this.shop,
    required this.starterKitNameToWorkwearIdToAmount,
    required this.warehouse,
    required this.defaultFromSupplier,
    required this.defaultUserPays,
    required this.enabledSupplierIds,
  }) : super(
          id: id ?? domainId,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Domain.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        tenant = json["tenant"],
        aliases = Set<Id<Domain>>.from(json["aliases"]),
        type = EasyType.fromString(json["type"]),
        supplierConfig = json["supplierConfig"] == null ? null : SupplierConfig.fromJson(json["supplierConfig"]),
        whiteLabelData = WhiteLabel.fromJson(json["whiteLabelData"]),
        registered = json["registered"] == null ? null : DateTime.parse(json["registered"]),
        verified = json["verified"] == null ? null : DateTime.parse(json["verified"]),
        licensesQuantity = json["licensesQuantity"],
        featureLevel = FeatureLevel.fromString(json["featureLevel"]),
        premiumTrialStartDate = json["premiumTrialStartDate"] == null ? null : DateTime.parse(json["premiumTrialStartDate"]),
        features = Features.fromJson(json["features"]),
        currency = Currency.fromString(json["currency"]),
        useCurrencyForBudget = json["useCurrencyForBudget"],
        delimiter = json["delimiter"],
        intratool = json["intratool"] == null ? null : Intratool.fromJson(json["intratool"]),
        beekeeper = json["beekeeper"] == null ? null : Beekeeper.fromJson(json["beekeeper"]),
        shop = (json["shop"] as Map).map((key, value) => MapEntry(key, value?.toDouble())),
        starterKitNameToWorkwearIdToAmount = (json["starterKitNameToWorkwearIdToAmount"] as Map).map((key, value) => MapEntry(key, (value as Map<String, dynamic>).map((k, v) => MapEntry(Id<Workwear>(k), v.toInt())))),
        warehouse = Inventory.fromJson(json["warehouse"]),
        defaultFromSupplier = json["defaultFromSupplier"],
        defaultUserPays = json["defaultUserPays"],
        enabledSupplierIds = json["enabledSupplierIds"] == null ? null : Set<Id<Domain>>.from(json["enabledSupplierIds"]),
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
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
        "currency": currency.string,
        "useCurrencyForBudget": useCurrencyForBudget,
        "delimiter": delimiter,
        "intratool": intratool?.toJson(),
        "beekeeper": beekeeper?.toJson(),
        "shop": shop,
        "starterKitNameToWorkwearIdToAmount": starterKitNameToWorkwearIdToAmount,
        "warehouse": warehouse.toJson(),
        "defaultFromSupplier": defaultFromSupplier,
        "defaultUserPays": defaultUserPays,
        "enabledSupplierIds": enabledSupplierIds?.map((e) => e.toString()).toList(),
        ...super.toJson(),
      };

  @override
  Domain fromJson(Map<String, dynamic> json) => Domain.fromJson(json);
}
