class Features {
  bool deposit;
  bool correction;
  bool requireUserOrderConfirmation;
  bool requireAdminApproval;
  int defaultDeliveryEtaDays;
  int defaultConfirmationDeadlineDays;

  Features({
    required this.deposit,
    required this.correction,
    required this.requireUserOrderConfirmation,
    required this.requireAdminApproval,
    required this.defaultDeliveryEtaDays,
    required this.defaultConfirmationDeadlineDays,
  });

  Features.fromJson(Map<String, dynamic> json)
      : deposit = json["deposit"],
        correction = json["correction"],
        requireUserOrderConfirmation = json["requireUserOrderConfirmation"] ?? false,
        requireAdminApproval = json["requireAdminApproval"] ?? false,
        defaultDeliveryEtaDays = json["defaultDeliveryEtaDays"] ?? 5,
        defaultConfirmationDeadlineDays = json["defaultConfirmationDeadlineDays"] ?? 7;

  Map<String, dynamic> toJson() => {
        "deposit": deposit,
        "correction": correction,
        "requireUserOrderConfirmation": requireUserOrderConfirmation,
        "requireAdminApproval": requireAdminApproval,
        "defaultDeliveryEtaDays": defaultDeliveryEtaDays,
        "defaultConfirmationDeadlineDays": defaultConfirmationDeadlineDays,
      };
}
