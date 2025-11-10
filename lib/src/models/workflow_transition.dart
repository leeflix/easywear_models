import 'package:easywear_models/easywear_models.dart';

/// Type of workflow transition
enum TransitionType {
  manual,
  automatic,
  scheduled,
  conditional,
}

extension TransitionTypeExt on TransitionType {
  String get string => toString().split(".").last;

  static TransitionType fromString(String s) =>
      TransitionType.values.firstWhere((e) => e.string == s);
}

/// Represents a transition between workflow states
class WorkflowTransition {
  String id;
  String name;
  String? fromStateId;
  String toStateId;
  Set<ViewMode> allowedRoles;
  List<WorkflowGuard> guards;
  List<WorkflowAction> actions;
  TransitionType type;
  String? confirmationMessage;
  bool requiresComment;
  Map<String, dynamic> metadata;

  WorkflowTransition({
    required this.id,
    required this.name,
    this.fromStateId,
    required this.toStateId,
    required this.allowedRoles,
    this.guards = const [],
    this.actions = const [],
    this.type = TransitionType.manual,
    this.confirmationMessage,
    this.requiresComment = false,
    this.metadata = const {},
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fromStateId": fromStateId,
        "toStateId": toStateId,
        "allowedRoles": allowedRoles.map((r) => r.string).toList(),
        "guards": guards.map((g) => g.toJson()).toList(),
        "actions": actions.map((a) => a.toJson()).toList(),
        "type": type.string,
        "confirmationMessage": confirmationMessage,
        "requiresComment": requiresComment,
        "metadata": metadata,
      };

  WorkflowTransition.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        fromStateId = json["fromStateId"],
        toStateId = json["toStateId"],
        allowedRoles = (json["allowedRoles"] as List)
            .map((r) => ViewModeExt.fromString(r))
            .toSet(),
        guards = (json["guards"] as List?)
                ?.map((g) => WorkflowGuard.fromJson(g))
                .toList() ??
            [],
        actions = (json["actions"] as List?)
                ?.map((a) => WorkflowAction.fromJson(a))
                .toList() ??
            [],
        type = TransitionTypeExt.fromString(json["type"] ?? "manual"),
        confirmationMessage = json["confirmationMessage"],
        requiresComment = json["requiresComment"] ?? false,
        metadata = json["metadata"] != null
            ? Map<String, dynamic>.from(json["metadata"])
            : {};

  WorkflowTransition copyWith({
    String? id,
    String? name,
    String? fromStateId,
    String? toStateId,
    Set<ViewMode>? allowedRoles,
    List<WorkflowGuard>? guards,
    List<WorkflowAction>? actions,
    TransitionType? type,
    String? confirmationMessage,
    bool? requiresComment,
    Map<String, dynamic>? metadata,
  }) =>
      WorkflowTransition(
        id: id ?? this.id,
        name: name ?? this.name,
        fromStateId: fromStateId ?? this.fromStateId,
        toStateId: toStateId ?? this.toStateId,
        allowedRoles: allowedRoles ?? this.allowedRoles,
        guards: guards ?? this.guards,
        actions: actions ?? this.actions,
        type: type ?? this.type,
        confirmationMessage: confirmationMessage ?? this.confirmationMessage,
        requiresComment: requiresComment ?? this.requiresComment,
        metadata: metadata ?? this.metadata,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkflowTransition &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
