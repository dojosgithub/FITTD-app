// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmailVerificationRequest {
  String email;
  String code;

  EmailVerificationRequest({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'email': email,
        'isVerification': true,
      };
}
