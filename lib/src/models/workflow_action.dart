import 'package:easywear_models/easywear_models.dart';

/// Types of actions that can be executed during workflow transitions
enum ActionType {
  sendEmail,
  sendWebhook,
  updateField,
  createSupplierOrder,
  linkOrders,
  createReservation,
  releaseReservation,
  completeReservation,
  updateInventory,
  logAudit,
  runScript,
  scheduleReminder,
  triggerWorkflow,
  sendNotification,
}

extension ActionTypeExt on ActionType {
  String get string => toString().split(".").last;

  static ActionType fromString(String s) =>
      ActionType.values.firstWhere((e) => e.string == s);

  String uiText(Language currentLanguage) {
    switch (this) {
      case ActionType.sendEmail:
        return switch (currentLanguage) {
          Language.de => "E-Mail senden",
          Language.en => "Send Email",
          _ => "Send Email",
        };
      case ActionType.sendWebhook:
        return switch (currentLanguage) {
          Language.de => "Webhook senden",
          Language.en => "Send Webhook",
          _ => "Send Webhook",
        };
      case ActionType.updateField:
        return switch (currentLanguage) {
          Language.de => "Feld aktualisieren",
          Language.en => "Update Field",
          _ => "Update Field",
        };
      case ActionType.createSupplierOrder:
        return switch (currentLanguage) {
          Language.de => "Lieferantenbestellung erstellen",
          Language.en => "Create Supplier Order",
          _ => "Create Supplier Order",
        };
      case ActionType.linkOrders:
        return switch (currentLanguage) {
          Language.de => "Bestellungen verknüpfen",
          Language.en => "Link Orders",
          _ => "Link Orders",
        };
      case ActionType.createReservation:
        return switch (currentLanguage) {
          Language.de => "Reservierung erstellen",
          Language.en => "Create Reservation",
          _ => "Create Reservation",
        };
      case ActionType.releaseReservation:
        return switch (currentLanguage) {
          Language.de => "Reservierung freigeben",
          Language.en => "Release Reservation",
          _ => "Release Reservation",
        };
      case ActionType.completeReservation:
        return switch (currentLanguage) {
          Language.de => "Reservierung abschließen",
          Language.en => "Complete Reservation",
          _ => "Complete Reservation",
        };
      case ActionType.updateInventory:
        return switch (currentLanguage) {
          Language.de => "Inventar aktualisieren",
          Language.en => "Update Inventory",
          _ => "Update Inventory",
        };
      case ActionType.logAudit:
        return switch (currentLanguage) {
          Language.de => "Audit-Log erstellen",
          Language.en => "Log Audit",
          _ => "Log Audit",
        };
      case ActionType.runScript:
        return switch (currentLanguage) {
          Language.de => "Skript ausführen",
          Language.en => "Run Script",
          _ => "Run Script",
        };
      case ActionType.scheduleReminder:
        return switch (currentLanguage) {
          Language.de => "Erinnerung planen",
          Language.en => "Schedule Reminder",
          _ => "Schedule Reminder",
        };
      case ActionType.triggerWorkflow:
        return switch (currentLanguage) {
          Language.de => "Workflow auslösen",
          Language.en => "Trigger Workflow",
          _ => "Trigger Workflow",
        };
      case ActionType.sendNotification:
        return switch (currentLanguage) {
          Language.de => "Benachrichtigung senden",
          Language.en => "Send Notification",
          _ => "Send Notification",
        };
    }
  }
}

/// Action to be executed during a workflow transition
class WorkflowAction {
  ActionType type;
  Map<String, dynamic> config;
  int executionOrder;

  WorkflowAction({
    required this.type,
    required this.config,
    this.executionOrder = 0,
  });

  Map<String, dynamic> toJson() => {
        "type": type.string,
        "config": config,
        "executionOrder": executionOrder,
      };

  WorkflowAction.fromJson(Map<String, dynamic> json)
      : type = ActionTypeExt.fromString(json["type"]),
        config = Map<String, dynamic>.from(json["config"]),
        executionOrder = json["executionOrder"] ?? 0;

  WorkflowAction copyWith({
    ActionType? type,
    Map<String, dynamic>? config,
    int? executionOrder,
  }) =>
      WorkflowAction(
        type: type ?? this.type,
        config: config ?? this.config,
        executionOrder: executionOrder ?? this.executionOrder,
      );
}
