import 'package:easywear_models/easywear_models.dart';

class LoginRequest {
  final Credentials? userCredentials;
  final String? skipLoginToken;
  final String? beekeeperToken;

  LoginRequest({
    this.userCredentials,
    this.skipLoginToken,
    this.beekeeperToken,
  });

  LoginRequest.fromJson(Map<String, dynamic> json)
      : userCredentials = json["credentials"] != null ? Credentials.fromJson(json["credentials"]) : null,
        skipLoginToken = json["skipLoginToken"],
        beekeeperToken = json["beekeeperToken"];
}