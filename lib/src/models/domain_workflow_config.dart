import 'package:easywear_models/easywear_models.dart';

/// Configuration for workflow assignments per domain
class DomainWorkflowConfig extends Model<DomainWorkflowConfig> {
  Id<WorkflowDefinition> orderWorkflowId;
  Id<WorkflowDefinition> claimWorkflowId;
  Id<WorkflowDefinition> correctionWorkflowId;
  Map<String, dynamic> globalSettings;

  DomainWorkflowConfig({
    required super.domainId,
    Id<DomainWorkflowConfig>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.orderWorkflowId,
    required this.claimWorkflowId,
    required this.correctionWorkflowId,
    this.globalSettings = const {},
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Map<String, dynamic> toJson() => {
        "orderWorkflowId": orderWorkflowId,
        "claimWorkflowId": claimWorkflowId,
        "correctionWorkflowId": correctionWorkflowId,
        "globalSettings": globalSettings,
        ...super.toJson(),
      };

  DomainWorkflowConfig.fromJson(Map<String, dynamic> json)
      : orderWorkflowId = json["orderWorkflowId"],
        claimWorkflowId = json["claimWorkflowId"],
        correctionWorkflowId = json["correctionWorkflowId"],
        globalSettings = json["globalSettings"] != null
            ? Map<String, dynamic>.from(json["globalSettings"])
            : {},
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  DomainWorkflowConfig fromJson(Map<String, dynamic> json) =>
      DomainWorkflowConfig.fromJson(json);

  /// Get workflow ID for a specific request type
  Id<WorkflowDefinition> getWorkflowIdForType(RequestType type) {
    switch (type) {
      case RequestType.order:
        return orderWorkflowId;
      case RequestType.claim:
        return claimWorkflowId;
      case RequestType.correction:
        return correctionWorkflowId;
    }
  }
}
