import 'package:easywear_models/easywear_models.dart';

class VerifyUserRequest {
  final VerifyUserToken userVerificationToken;
  final Language language;

  VerifyUserRequest({
    required this.userVerificationToken,
    required this.language,
  });
}