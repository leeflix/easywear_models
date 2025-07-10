import 'package:easywear_models/easywear_models.dart';

class Features extends DataClass<Features> {
  bool deposit;
  bool correction;

  Features({
    required this.deposit,
    required this.correction,
  });

  Features.fromJson(Map<String, dynamic> json)
      : deposit = json["deposit"],
        correction = json["correction"];

  Map<String, dynamic> toJson() => {
        "deposit": deposit,
        "correction": correction,
      };

  @override
  Features fromJson(Map<String, dynamic> json) => Features.fromJson(json);
}
