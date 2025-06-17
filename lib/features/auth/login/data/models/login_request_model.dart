// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequestModel {
  final String email;
  final String password;
  final String fcmToken;

  LoginRequestModel({
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password, 'fcmToken': fcmToken};
}
