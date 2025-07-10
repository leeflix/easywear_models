import 'package:easywear_models/easywear_models.dart';

class Beekeeper extends DataClass<Beekeeper> {
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

  @override
  Beekeeper fromJson(Map<String, dynamic> json) => Beekeeper.fromJson(json);
}
