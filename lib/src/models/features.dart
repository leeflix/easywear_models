class Features {
  bool deposit;
  bool correction;
  bool requireUserOrderConfirmation;
  int defaultDeliveryEtaDays;
  int defaultConfirmationDeadlineDays;

  Features({
    required this.deposit,
    required this.correction,
    required this.requireUserOrderConfirmation,
    required this.defaultDeliveryEtaDays,
    required this.defaultConfirmationDeadlineDays,
  });

  Features.fromJson(Map<String, dynamic> json)
      : deposit = json["deposit"],
        correction = json["correction"],
        requireUserOrderConfirmation = json["requireUserOrderConfirmation"] ?? false,
        defaultDeliveryEtaDays = json["defaultDeliveryEtaDays"] ?? 5,
        defaultConfirmationDeadlineDays = json["defaultConfirmationDeadlineDays"] ?? 7;

  Map<String, dynamic> toJson() => {
        "deposit": deposit,
        "correction": correction,
        "requireUserOrderConfirmation": requireUserOrderConfirmation,
        "defaultDeliveryEtaDays": defaultDeliveryEtaDays,
        "defaultConfirmationDeadlineDays": defaultConfirmationDeadlineDays,
      };
}
