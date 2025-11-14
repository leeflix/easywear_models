class Beekeeper {
  final String? accessToken;
  final String fqdn;
  final bool autoCreateUsers;

  Beekeeper({
    required this.accessToken,
    required this.fqdn,
    required this.autoCreateUsers,
  });

  Beekeeper.fromJson(Map<String, dynamic> json)
      : accessToken = json["accessToken"],
        fqdn = json["fqdn"],
        autoCreateUsers = json["autoCreateUsers"];

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "fqdn": fqdn,
        "autoCreateUsers": autoCreateUsers,
      };
}
