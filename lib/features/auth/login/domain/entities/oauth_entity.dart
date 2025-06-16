import '../../data/models/oauth_response_mode.dart';

class OauthEntity {
  OauthEntity({
    required this.user,
    required this.accessToken,
  });
  final String? accessToken;
  final User? user;
}
