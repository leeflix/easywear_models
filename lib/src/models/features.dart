class Features {
  bool deposit;
  bool correction;
  bool requireUserOrderConfirmation;
  bool requireAdminApproval;
  bool useBudgetSystem;
  int defaultDeliveryEtaDays;
  int defaultConfirmationDeadlineDays;
  bool requireDepartmentForBooking;
  bool requireLocationForBooking;

  Features({
    required this.deposit,
    required this.correction,
    required this.requireUserOrderConfirmation,
    required this.requireAdminApproval,
    required this.useBudgetSystem,
    required this.defaultDeliveryEtaDays,
    required this.defaultConfirmationDeadlineDays,
    required this.requireDepartmentForBooking,
    required this.requireLocationForBooking,
  });

  Features.fromJson(Map<String, dynamic> json)
      : deposit = json["deposit"],
        correction = json["correction"],
        requireUserOrderConfirmation = json["requireUserOrderConfirmation"],
        requireAdminApproval = json["requireAdminApproval"],
        useBudgetSystem = json["useBudgetSystem"],
        defaultDeliveryEtaDays = json["defaultDeliveryEtaDays"],
        defaultConfirmationDeadlineDays = json["defaultConfirmationDeadlineDays"],
        requireDepartmentForBooking = json["requireDepartmentForBooking"],
        requireLocationForBooking = json["requireLocationForBooking"];

  Map<String, dynamic> toJson() => {
        "deposit": deposit,
        "correction": correction,
        "requireUserOrderConfirmation": requireUserOrderConfirmation,
        "requireAdminApproval": requireAdminApproval,
        "useBudgetSystem": useBudgetSystem,
        "defaultDeliveryEtaDays": defaultDeliveryEtaDays,
        "defaultConfirmationDeadlineDays": defaultConfirmationDeadlineDays,
        "requireDepartmentForBooking": requireDepartmentForBooking,
        "requireLocationForBooking": requireLocationForBooking,
      };
}
