class ForgotPasswordResponse {
  String message;

  ForgotPasswordResponse({
    required this.message,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json["message"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}
