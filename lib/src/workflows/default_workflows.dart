import 'package:easywear_models/easywear_models.dart';

/// Factory class for creating default workflow definitions
class DefaultWorkflows {
  /// Creates the classic order workflow that matches the original RequestStatus-based behavior
  static WorkflowDefinition createClassicOrderWorkflow({
    required Id<Domain> domainId,
  }) {
    return WorkflowDefinition(
      domainId: domainId,
      name: "Classic Order Flow",
      description: "Standard EasyWear order workflow - matches original behavior",
      type: RequestType.order,
      isActive: true,
      isSystemDefault: false,
      version: 1,
      states: [
        // State: created (initial state for employee requests)
        WorkflowState(
          id: "created",
          name: "Created",
          labels: {
            Language.de: "Neu",
            Language.en: "New",
            Language.fr: "Nouveau",
            Language.it: "Nuovo",
            Language.es: "Nuevo",
          },
          icon: "add_circle",
          color: "#2196F3",
          displayOrder: 0,
        ),
        // State: inProgress (admin is processing)
        WorkflowState(
          id: "inProgress",
          name: "In Progress",
          labels: {
            Language.de: "In Bearbeitung",
            Language.en: "In Progress",
            Language.fr: "En cours",
            Language.it: "In corso",
            Language.es: "En progreso",
          },
          icon: "pending",
          color: "#FF9800",
          displayOrder: 1,
        ),
        // State: ordered (ordered from supplier)
        WorkflowState(
          id: "ordered",
          name: "Ordered",
          labels: {
            Language.de: "Bestellt",
            Language.en: "Ordered",
            Language.fr: "Commandé",
            Language.it: "Ordinato",
            Language.es: "Pedido",
          },
          icon: "local_shipping",
          color: "#3F51B5",
          displayOrder: 2,
        ),
        // State: awaitingUserConfirmation (waiting for user to confirm receipt)
        WorkflowState(
          id: "awaitingUserConfirmation",
          name: "Awaiting User Confirmation",
          labels: {
            Language.de: "Wartet auf Bestätigung",
            Language.en: "Awaiting Confirmation",
            Language.fr: "En attente de confirmation",
            Language.it: "In attesa di conferma",
            Language.es: "Esperando confirmación",
          },
          icon: "how_to_reg",
          color: "#9C27B0",
          displayOrder: 3,
        ),
        // Terminal state: completed
        WorkflowState(
          id: "completed",
          name: "Completed",
          labels: {
            Language.de: "Abgeschlossen",
            Language.en: "Completed",
            Language.fr: "Terminé",
            Language.it: "Completato",
            Language.es: "Completado",
          },
          type: StateType.terminal,
          icon: "check_circle",
          color: "#4CAF50",
          displayOrder: 4,
        ),
        // Terminal state: rejected
        WorkflowState(
          id: "rejected",
          name: "Rejected",
          labels: {
            Language.de: "Abgelehnt",
            Language.en: "Rejected",
            Language.fr: "Rejeté",
            Language.it: "Rifiutato",
            Language.es: "Rechazado",
          },
          type: StateType.terminal,
          icon: "cancel",
          color: "#F44336",
          displayOrder: 5,
        ),
        // Terminal state: canceled
        WorkflowState(
          id: "canceled",
          name: "Canceled",
          labels: {
            Language.de: "Storniert",
            Language.en: "Canceled",
            Language.fr: "Annulé",
            Language.it: "Annullato",
            Language.es: "Cancelado",
          },
          type: StateType.terminal,
          icon: "block",
          color: "#9E9E9E",
          displayOrder: 6,
        ),
      ],
      transitions: [
        // Transition: Admin/Supplier accepts request
        WorkflowTransition(
          id: "accept_request",
          name: "Accept Request",
          fromStateId: "created",
          toStateId: "inProgress",
          allowedRoles: {ViewMode.admin, ViewMode.supplier},
          type: TransitionType.manual,
        ),
        // Transition: Admin adds to cart (creates reservation)
        WorkflowTransition(
          id: "add_to_cart",
          name: "Add to Cart",
          fromStateId: "inProgress",
          toStateId: "inProgress", // Stays in same state, just reserves
          allowedRoles: {ViewMode.admin},
          type: TransitionType.manual,
          guards: [
            WorkflowGuard(
              type: GuardType.noActiveReservation,
              config: {"checkConflicts": true},
            ),
            WorkflowGuard(
              type: GuardType.notAlreadyOrdered,
              config: {},
            ),
          ],
          actions: [
            WorkflowAction(
              type: ActionType.createReservation,
              config: {"expirationHours": 24},
              executionOrder: 1,
            ),
          ],
        ),
        // Transition: Admin places supplier order
        WorkflowTransition(
          id: "place_supplier_order",
          name: "Place Supplier Order",
          fromStateId: "inProgress",
          toStateId: "ordered",
          allowedRoles: {ViewMode.admin},
          type: TransitionType.manual,
          guards: [
            WorkflowGuard(
              type: GuardType.hasActiveReservation,
              config: {},
            ),
          ],
          actions: [
            WorkflowAction(
              type: ActionType.createSupplierOrder,
              config: {},
              executionOrder: 1,
            ),
            WorkflowAction(
              type: ActionType.linkOrders,
              config: {},
              executionOrder: 2,
            ),
            WorkflowAction(
              type: ActionType.completeReservation,
              config: {},
              executionOrder: 3,
            ),
          ],
        ),
        // Transition: Admin completes order (direct from inProgress to awaitingUserConfirmation)
        WorkflowTransition(
          id: "complete_request",
          name: "Complete Request",
          fromStateId: "inProgress",
          toStateId: "awaitingUserConfirmation",
          allowedRoles: {ViewMode.admin},
          type: TransitionType.manual,
        ),
        // Transition: Admin completes order after it's been ordered from supplier
        WorkflowTransition(
          id: "complete_order_from_ordered",
          name: "Complete Order",
          fromStateId: "ordered",
          toStateId: "awaitingUserConfirmation",
          allowedRoles: {ViewMode.admin, ViewMode.supplier},
          type: TransitionType.manual,
        ),
        // Transition: User/Admin confirms delivery
        WorkflowTransition(
          id: "confirm_delivery",
          name: "Confirm Delivery",
          fromStateId: "awaitingUserConfirmation",
          toStateId: "completed",
          allowedRoles: {ViewMode.user, ViewMode.admin},
          type: TransitionType.manual,
        ),
        // Transition: Admin/Supplier rejects request
        WorkflowTransition(
          id: "reject_request",
          name: "Reject Request",
          fromStateId: "created",
          toStateId: "rejected",
          allowedRoles: {ViewMode.admin, ViewMode.supplier},
          type: TransitionType.manual,
          requiresComment: true,
        ),
        // Transition: Admin rejects from inProgress
        WorkflowTransition(
          id: "reject_from_progress",
          name: "Reject",
          fromStateId: "inProgress",
          toStateId: "rejected",
          allowedRoles: {ViewMode.admin, ViewMode.supplier},
          type: TransitionType.manual,
          requiresComment: true,
          actions: [
            WorkflowAction(
              type: ActionType.releaseReservation,
              config: {},
            ),
          ],
        ),
        // Transition: User cancels order
        WorkflowTransition(
          id: "cancel_request",
          name: "Cancel Request",
          fromStateId: "created",
          toStateId: "canceled",
          allowedRoles: {ViewMode.user},
          type: TransitionType.manual,
        ),
        // Transition: User/Admin cancels from inProgress
        WorkflowTransition(
          id: "cancel_from_progress",
          name: "Cancel",
          fromStateId: "inProgress",
          toStateId: "canceled",
          allowedRoles: {ViewMode.user, ViewMode.admin},
          type: TransitionType.manual,
          actions: [
            WorkflowAction(
              type: ActionType.releaseReservation,
              config: {},
            ),
          ],
        ),
        // Transition: Admin/User cancels from awaitingUserConfirmation
        WorkflowTransition(
          id: "cancel_from_awaiting",
          name: "Cancel",
          fromStateId: "awaitingUserConfirmation",
          toStateId: "canceled",
          allowedRoles: {ViewMode.user, ViewMode.admin},
          type: TransitionType.manual,
        ),
      ],
      initialStateId: "created",
      terminalStateIds: {"completed", "rejected", "canceled"},
    );
  }

  /// Creates the classic claim workflow
  static WorkflowDefinition createClassicClaimWorkflow({
    required Id<Domain> domainId,
  }) {
    // Claims use the same workflow as orders
    var workflow = createClassicOrderWorkflow(domainId: domainId);
    return workflow.copyWith(
      name: "Classic Claim Flow",
      description: "Standard EasyWear claim workflow",
      type: RequestType.claim,
    );
  }

  /// Creates the classic correction workflow
  static WorkflowDefinition createClassicCorrectionWorkflow({
    required Id<Domain> domainId,
  }) {
    return WorkflowDefinition(
      domainId: domainId,
      name: "Classic Correction Flow",
      description: "Standard EasyWear correction workflow",
      type: RequestType.correction,
      isActive: true,
      isSystemDefault: false,
      version: 1,
      states: [
        WorkflowState(
          id: "created",
          name: "Created",
          labels: {
            Language.de: "Neu",
            Language.en: "New",
          },
          icon: "add_circle",
          color: "#2196F3",
          displayOrder: 0,
        ),
        WorkflowState(
          id: "inProgress",
          name: "In Progress",
          labels: {
            Language.de: "In Bearbeitung",
            Language.en: "In Progress",
          },
          icon: "pending",
          color: "#FF9800",
          displayOrder: 1,
        ),
        WorkflowState(
          id: "completed",
          name: "Completed",
          labels: {
            Language.de: "Abgeschlossen",
            Language.en: "Completed",
          },
          type: StateType.terminal,
          icon: "check_circle",
          color: "#4CAF50",
          displayOrder: 2,
        ),
        WorkflowState(
          id: "rejected",
          name: "Rejected",
          labels: {
            Language.de: "Abgelehnt",
            Language.en: "Rejected",
          },
          type: StateType.terminal,
          icon: "cancel",
          color: "#F44336",
          displayOrder: 3,
        ),
      ],
      transitions: [
        WorkflowTransition(
          id: "accept_correction",
          name: "Accept Correction",
          fromStateId: "created",
          toStateId: "inProgress",
          allowedRoles: {ViewMode.admin},
          type: TransitionType.manual,
        ),
        WorkflowTransition(
          id: "complete_correction",
          name: "Complete Correction",
          fromStateId: "inProgress",
          toStateId: "completed",
          allowedRoles: {ViewMode.admin},
          type: TransitionType.manual,
        ),
        WorkflowTransition(
          id: "reject_correction",
          name: "Reject Correction",
          fromStateId: "created",
          toStateId: "rejected",
          allowedRoles: {ViewMode.admin},
          type: TransitionType.manual,
          requiresComment: true,
        ),
      ],
      initialStateId: "created",
      terminalStateIds: {"completed", "rejected"},
    );
  }
}
