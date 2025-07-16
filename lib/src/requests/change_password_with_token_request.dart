import 'package:easywear_models/easywear_models.dart';

class ChangePasswordWithTokenRequest {
  final Language language;
  final String newPassword;
  final ChangePasswordToken changePasswordToken;

  ChangePasswordWithTokenRequest({
    required this.language,
    required this.newPassword,
    required this.changePasswordToken,
  });
}