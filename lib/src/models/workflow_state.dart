import 'package:easywear_models/easywear_models.dart';

/// Type of workflow state
enum StateType {
  normal,
  terminal,
  parallel,
  waiting,
}

extension StateTypeExt on StateType {
  String get string => toString().split(".").last;

  static StateType fromString(String s) =>
      StateType.values.firstWhere((e) => e.string == s);
}

/// Represents a state in a workflow
class WorkflowState {
  String id;
  String name;
  Map<Language, String> labels;
  StateType type;
  String? icon;
  String? color;
  int displayOrder;
  Duration? timeoutDuration;
  String? timeoutTransitionId;
  Map<String, dynamic> metadata;

  WorkflowState({
    required this.id,
    required this.name,
    required this.labels,
    this.type = StateType.normal,
    this.icon,
    this.color,
    this.displayOrder = 0,
    this.timeoutDuration,
    this.timeoutTransitionId,
    this.metadata = const {},
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "labels": labels.map((key, value) => MapEntry(key.string, value)),
        "type": type.string,
        "icon": icon,
        "color": color,
        "displayOrder": displayOrder,
        "timeoutDuration": timeoutDuration?.inSeconds,
        "timeoutTransitionId": timeoutTransitionId,
        "metadata": metadata,
      };

  WorkflowState.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        labels = (json["labels"] as Map).map(
          (key, value) => MapEntry(LanguageExt.fromString(key), value as String),
        ),
        type = StateTypeExt.fromString(json["type"] ?? "normal"),
        icon = json["icon"],
        color = json["color"],
        displayOrder = json["displayOrder"] ?? 0,
        timeoutDuration = json["timeoutDuration"] != null
            ? Duration(seconds: json["timeoutDuration"])
            : null,
        timeoutTransitionId = json["timeoutTransitionId"],
        metadata = json["metadata"] != null
            ? Map<String, dynamic>.from(json["metadata"])
            : {};

  WorkflowState copyWith({
    String? id,
    String? name,
    Map<Language, String>? labels,
    StateType? type,
    String? icon,
    String? color,
    int? displayOrder,
    Duration? timeoutDuration,
    String? timeoutTransitionId,
    Map<String, dynamic>? metadata,
  }) =>
      WorkflowState(
        id: id ?? this.id,
        name: name ?? this.name,
        labels: labels ?? this.labels,
        type: type ?? this.type,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        displayOrder: displayOrder ?? this.displayOrder,
        timeoutDuration: timeoutDuration ?? this.timeoutDuration,
        timeoutTransitionId: timeoutTransitionId ?? this.timeoutTransitionId,
        metadata: metadata ?? this.metadata,
      );

  /// Get localized label for current language
  String getLabel(Language language) {
    return labels[language] ?? name;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkflowState && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
