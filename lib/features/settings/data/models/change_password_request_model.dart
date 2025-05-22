class ChangePasswordRequestModel {
  final String email;
  final String oldPassword;
  final String password;

  ChangePasswordRequestModel({
    required this.email,
    required this.oldPassword,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'oldPassword': oldPassword,
      'password': password,
    };
  }
}
