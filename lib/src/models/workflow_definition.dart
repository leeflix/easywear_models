import 'package:easywear_models/easywear_models.dart';

/// Represents a complete workflow definition
class WorkflowDefinition extends Model<WorkflowDefinition> {
  String name;
  String description;
  RequestType type;
  List<WorkflowState> states;
  List<WorkflowTransition> transitions;
  String initialStateId;
  Set<String> terminalStateIds;
  bool isActive;
  bool isSystemDefault;
  int version;

  WorkflowDefinition({
    required super.domainId,
    Id<WorkflowDefinition>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    this.description = "",
    required this.type,
    required this.states,
    required this.transitions,
    required this.initialStateId,
    required this.terminalStateIds,
    this.isActive = true,
    this.isSystemDefault = false,
    this.version = 1,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type": type.string,
        "states": states.map((s) => s.toJson()).toList(),
        "transitions": transitions.map((t) => t.toJson()).toList(),
        "initialStateId": initialStateId,
        "terminalStateIds": terminalStateIds.toList(),
        "isActive": isActive,
        "isSystemDefault": isSystemDefault,
        "version": version,
        ...super.toJson(),
      };

  WorkflowDefinition.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"] ?? "",
        type = RequestTypeE.fromString(json["type"]),
        states = (json["states"] as List)
            .map((s) => WorkflowState.fromJson(s))
            .toList(),
        transitions = (json["transitions"] as List)
            .map((t) => WorkflowTransition.fromJson(t))
            .toList(),
        initialStateId = json["initialStateId"],
        terminalStateIds = Set<String>.from(json["terminalStateIds"]),
        isActive = json["isActive"] ?? true,
        isSystemDefault = json["isSystemDefault"] ?? false,
        version = json["version"] ?? 1,
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  WorkflowDefinition fromJson(Map<String, dynamic> json) =>
      WorkflowDefinition.fromJson(json);

  WorkflowDefinition copyWith({
    Id<Domain>? domainId,
    Id<WorkflowDefinition>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    String? name,
    String? description,
    RequestType? type,
    List<WorkflowState>? states,
    List<WorkflowTransition>? transitions,
    String? initialStateId,
    Set<String>? terminalStateIds,
    bool? isActive,
    bool? isSystemDefault,
    int? version,
  }) =>
      WorkflowDefinition(
        domainId: domainId ?? this.domainId,
        id: id ?? this.id,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        isArchived: isArchived ?? this.isArchived,
        name: name ?? this.name,
        description: description ?? this.description,
        type: type ?? this.type,
        states: states ?? this.states,
        transitions: transitions ?? this.transitions,
        initialStateId: initialStateId ?? this.initialStateId,
        terminalStateIds: terminalStateIds ?? this.terminalStateIds,
        isActive: isActive ?? this.isActive,
        isSystemDefault: isSystemDefault ?? this.isSystemDefault,
        version: version ?? this.version,
      );

  /// Get a state by ID
  WorkflowState? getState(String stateId) {
    try {
      return states.firstWhere((s) => s.id == stateId);
    } catch (e) {
      return null;
    }
  }

  /// Get all transitions from a specific state
  List<WorkflowTransition> getTransitionsFromState(String stateId) {
    return transitions.where((t) => t.fromStateId == stateId).toList();
  }

  /// Check if a state is terminal
  bool isTerminalState(String stateId) {
    return terminalStateIds.contains(stateId);
  }

  /// Get initial state
  WorkflowState? getInitialState() {
    return getState(initialStateId);
  }
}
