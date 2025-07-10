import 'package:easywear_models/easywear_models.dart';

class Intratool extends DataClass<Intratool> {
  final String accessToken;
  final Map<String, dynamic> jwk;

  Intratool({
    required this.accessToken,
    required this.jwk,
  });

  Intratool.fromJson(Map<String, dynamic> json)
      : accessToken = json["accessToken"],
        jwk = json["jwk"];

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "jwk": jwk,
      };

  @override
  Intratool fromJson(Map<String, dynamic> json) => Intratool.fromJson(json);
}
