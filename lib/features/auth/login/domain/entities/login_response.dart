import '../../data/models/login_response_model.dart';

class LoginResponse {
  LoginResponse({
    required this.user,
    required this.accessToken,
  });
  final String? accessToken;
  final User? user;
}
