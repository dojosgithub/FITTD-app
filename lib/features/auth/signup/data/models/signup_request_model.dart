class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  final String fcmToken;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'fcmToken': fcmToken,
      };
}
