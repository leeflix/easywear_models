class Intratool {
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
}
