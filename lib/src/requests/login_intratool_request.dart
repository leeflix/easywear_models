import 'package:easywear_models/easywear_models.dart';

class LoginIntratoolRequest {
  final String token;
  final Id<Domain> domainId;

  LoginIntratoolRequest({
    required this.token,
    required this.domainId,
  });
}