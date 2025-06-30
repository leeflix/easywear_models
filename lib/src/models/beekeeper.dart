class Beekeeper {
  final String? accessToken;
  final String fqdn;

  Beekeeper({
    required this.accessToken,
    required this.fqdn,
  });

  Beekeeper.fromJson(Map<String, dynamic> json)
      : accessToken = json["accessToken"],
        fqdn = json["fqdn"];

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "fqdn": fqdn,
      };
}
