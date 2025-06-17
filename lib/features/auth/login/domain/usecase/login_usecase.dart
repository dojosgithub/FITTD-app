import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/login/data/models/login_request_model.dart';
import 'package:fitted/features/auth/login/domain/entities/login_entity.dart';
import 'package:fitted/features/auth/login/domain/respository/login_repository.dart';

import '../entities/oauth_entity.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
    required String fcmToken,
  }) async {
    return await repository.login(LoginRequestModel(
      email: email,
      password: password,
      fcmToken: fcmToken,
    ));
  }
}

class OAuthUseCase {
  final LoginRepository repository;

  OAuthUseCase(this.repository);

  Future<Either<Failure, OauthEntity>> call({
    required String googleTokenId,
    required String fcmToken,
  }) async {
    return await repository.oAuth(googleTokenId, fcmToken);
  }
}
