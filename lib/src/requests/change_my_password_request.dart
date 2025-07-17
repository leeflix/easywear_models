class ChangePasswordOfUserRequest {
  final String oldPassword;
  final String newPassword;

  ChangePasswordOfUserRequest({
    required this.oldPassword,
    required this.newPassword,
  });
}