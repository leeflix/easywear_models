class Staffbase {
  final String? accessToken; // For future notification API
  final String publicKey; // RSA public key for JWT verification
  final String issuerDomain; // e.g., "my.echterhoff.de"
  final String instanceId; // Plugin instance ID
  final bool autoCreateUsers;

  Staffbase({
    this.accessToken,
    required this.publicKey,
    required this.issuerDomain,
    required this.instanceId,
    required this.autoCreateUsers,
  });

  Staffbase.fromJson(Map<String, dynamic> json)
      : accessToken = json["accessToken"],
        publicKey = json["publicKey"],
        issuerDomain = json["issuerDomain"],
        instanceId = json["instanceId"],
        autoCreateUsers = json["autoCreateUsers"];

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "publicKey": publicKey,
        "issuerDomain": issuerDomain,
        "instanceId": instanceId,
        "autoCreateUsers": autoCreateUsers,
      };
}
