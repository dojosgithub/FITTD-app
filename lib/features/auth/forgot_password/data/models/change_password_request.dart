// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChangePasswordRequest {
  String email;
  String password;

  ChangePasswordRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
