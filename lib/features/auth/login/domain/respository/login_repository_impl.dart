import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/login/data/datasources/login_remote_datasources.dart';
import 'package:fitted/features/auth/login/domain/entities/oauth_entity.dart';

import '../../data/models/login_request_model.dart';
import '../entities/login_entity.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoginEntity>> login(LoginRequestModel model) async {
    try {
      final responseModel = await dataSource.login(model);

      return Right(
        LoginEntity(
          user: responseModel.data?.user,
          accessToken: responseModel.data?.tokens?.accessToken,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OauthEntity>> oAuth(String googleTokenId) async {
    try {
      final responseModel = await dataSource.oAuth(googleTokenId);

      return Right(
        OauthEntity(
          user: responseModel.user,
          accessToken: responseModel.tokens?.accessToken,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
