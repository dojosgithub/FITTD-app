// ignore_for_file: public_member_api_docs, sort_constructors_first
class OtpVerificationRequest {
  String email;
  String code;

  OtpVerificationRequest({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'email': email,
      };
}
