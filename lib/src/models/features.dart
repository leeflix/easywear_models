class Features {
  bool deposit;
  bool correction;
  bool requireUserOrderConfirmation;

  Features({
    required this.deposit,
    required this.correction,
    required this.requireUserOrderConfirmation,
  });

  Features.fromJson(Map<String, dynamic> json)
      : deposit = json["deposit"],
        correction = json["correction"],
        requireUserOrderConfirmation = json["requireUserOrderConfirmation"] ?? false;

  Map<String, dynamic> toJson() => {
        "deposit": deposit,
        "correction": correction,
        "requireUserOrderConfirmation": requireUserOrderConfirmation,
      };
}
