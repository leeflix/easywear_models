import 'package:easywear_models/easywear_models.dart';

class ForgotPasswordRequest {
  final Language language;
  final String userNameOrCompanyMail;

  ForgotPasswordRequest({
    required this.language,
    required this.userNameOrCompanyMail,
  });
}