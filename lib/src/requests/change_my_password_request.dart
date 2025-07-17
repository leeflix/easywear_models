class ChangeMyPasswordRequest {
  final String oldPassword;
  final String newPassword;

  ChangeMyPasswordRequest({
    required this.oldPassword,
    required this.newPassword,
  });
}