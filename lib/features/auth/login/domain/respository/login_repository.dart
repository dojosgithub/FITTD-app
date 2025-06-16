import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import '../../data/models/login_request_model.dart';
import '../entities/login_entity.dart';
import '../entities/oauth_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(LoginRequestModel model);
  Future<Either<Failure, OauthEntity>> oAuth(String googleTokenId);
}
