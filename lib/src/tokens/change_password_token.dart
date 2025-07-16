import 'package:easywear_models/easywear_models.dart';

class ChangePasswordToken extends UserToken<ChangePasswordToken> {
  ChangePasswordToken({required super.userId});

  ChangePasswordToken.fromJson(super.json) : super.fromJson();

  ChangePasswordToken.fromToken({
    required super.token,
    required super.secret,
  }) : super.fromToken();
}
