import 'package:easywear_models/easywear_models.dart';

/// Types of guards that validate transitions
enum GuardType {
  budgetLimit,
  approvalCount,
  inventoryAvailable,
  workingHours,
  customField,
  externalApi,
  script,
  noActiveReservation,
  hasActiveReservation,
  notAlreadyOrdered,
  userHasPermission,
  orderValueRange,
}

extension GuardTypeExt on GuardType {
  String get string => toString().split(".").last;

  static GuardType fromString(String s) =>
      GuardType.values.firstWhere((e) => e.string == s);

  String uiText(Language currentLanguage) {
    switch (this) {
      case GuardType.budgetLimit:
        return switch (currentLanguage) {
          Language.de => "Budgetlimit",
          Language.en => "Budget Limit",
          _ => "Budget Limit",
        };
      case GuardType.approvalCount:
        return switch (currentLanguage) {
          Language.de => "Anzahl Genehmigungen",
          Language.en => "Approval Count",
          _ => "Approval Count",
        };
      case GuardType.inventoryAvailable:
        return switch (currentLanguage) {
          Language.de => "Inventar verfügbar",
          Language.en => "Inventory Available",
          _ => "Inventory Available",
        };
      case GuardType.workingHours:
        return switch (currentLanguage) {
          Language.de => "Arbeitszeiten",
          Language.en => "Working Hours",
          _ => "Working Hours",
        };
      case GuardType.customField:
        return switch (currentLanguage) {
          Language.de => "Benutzerdefiniertes Feld",
          Language.en => "Custom Field",
          _ => "Custom Field",
        };
      case GuardType.externalApi:
        return switch (currentLanguage) {
          Language.de => "Externe API",
          Language.en => "External API",
          _ => "External API",
        };
      case GuardType.script:
        return switch (currentLanguage) {
          Language.de => "Skript",
          Language.en => "Script",
          _ => "Script",
        };
      case GuardType.noActiveReservation:
        return switch (currentLanguage) {
          Language.de => "Keine aktive Reservierung",
          Language.en => "No Active Reservation",
          _ => "No Active Reservation",
        };
      case GuardType.hasActiveReservation:
        return switch (currentLanguage) {
          Language.de => "Hat aktive Reservierung",
          Language.en => "Has Active Reservation",
          _ => "Has Active Reservation",
        };
      case GuardType.notAlreadyOrdered:
        return switch (currentLanguage) {
          Language.de => "Noch nicht bestellt",
          Language.en => "Not Already Ordered",
          _ => "Not Already Ordered",
        };
      case GuardType.userHasPermission:
        return switch (currentLanguage) {
          Language.de => "Benutzer hat Berechtigung",
          Language.en => "User Has Permission",
          _ => "User Has Permission",
        };
      case GuardType.orderValueRange:
        return switch (currentLanguage) {
          Language.de => "Bestellwert-Bereich",
          Language.en => "Order Value Range",
          _ => "Order Value Range",
        };
    }
  }
}

/// Guard condition that must be satisfied for a transition to be allowed
class WorkflowGuard {
  GuardType type;
  Map<String, dynamic> config;

  WorkflowGuard({
    required this.type,
    required this.config,
  });

  Map<String, dynamic> toJson() => {
        "type": type.string,
        "config": config,
      };

  WorkflowGuard.fromJson(Map<String, dynamic> json)
      : type = GuardTypeExt.fromString(json["type"]),
        config = Map<String, dynamic>.from(json["config"]);

  WorkflowGuard copyWith({
    GuardType? type,
    Map<String, dynamic>? config,
  }) =>
      WorkflowGuard(
        type: type ?? this.type,
        config: config ?? this.config,
      );
}
