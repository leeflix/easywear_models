import 'package:easywear_models/easywear_models.dart';

class ChangePasswordOfUserRequest {
  final Id<User> userId;
  final String password;

  ChangePasswordOfUserRequest({
    required this.userId,
    required this.password,
  });
}
