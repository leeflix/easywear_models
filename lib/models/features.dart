class Features {
  bool deposit;
  bool correction;

  Features(this.deposit, this.correction);

  Features.fromJson(Map<String, dynamic> json)
    : deposit = json["deposit"],
      correction = json["correction"];

  Map<String, dynamic> toJson() => {
    "deposit": deposit,
    "correction": correction,
  };
}
