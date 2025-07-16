class LoginBeekeeperRequest {
  final String token;
  final bool? createAccount;

  LoginBeekeeperRequest({
    required this.token,
    required this.createAccount,
  });
}