import 'package:easywear_models/easywear_models.dart';

/// Audit trail record for workflow state transitions
class WorkflowHistory extends Model<WorkflowHistory> {
  Id<Request> requestId;
  String fromStateId;
  String toStateId;
  String transitionId;
  Id<User> triggeredBy;
  DateTime triggeredAt;
  String? comment;
  Map<String, dynamic> metadata;

  WorkflowHistory({
    required super.domainId,
    Id<WorkflowHistory>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.requestId,
    required this.fromStateId,
    required this.toStateId,
    required this.transitionId,
    required this.triggeredBy,
    required this.triggeredAt,
    this.comment,
    this.metadata = const {},
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "fromStateId": fromStateId,
        "toStateId": toStateId,
        "transitionId": transitionId,
        "triggeredBy": triggeredBy,
        "triggeredAt": triggeredAt.toIso8601String(),
        "comment": comment,
        "metadata": metadata,
        ...super.toJson(),
      };

  WorkflowHistory.fromJson(Map<String, dynamic> json)
      : requestId = json["requestId"],
        fromStateId = json["fromStateId"],
        toStateId = json["toStateId"],
        transitionId = json["transitionId"],
        triggeredBy = json["triggeredBy"],
        triggeredAt = DateTime.parse(json["triggeredAt"]),
        comment = json["comment"],
        metadata = json["metadata"] != null
            ? Map<String, dynamic>.from(json["metadata"])
            : {},
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  WorkflowHistory fromJson(Map<String, dynamic> json) =>
      WorkflowHistory.fromJson(json);
}
