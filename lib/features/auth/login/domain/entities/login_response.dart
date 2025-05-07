class LoginResponse {
  LoginResponse({
    required this.id,
    required this.accessToken,
    required this.isVerified,
  });
  final String? accessToken;
  final String? id;
  final bool? isVerified;
}
