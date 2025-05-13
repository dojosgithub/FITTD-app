import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/login/data/datasources/login_remote_datasources.dart';

import '../../data/models/login_request_model.dart';
import '../entities/login_response.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequestModel model) async {
    try {
      final responseModel = await dataSource.login(model);
      return Right(
        LoginResponse(
          user: responseModel.data?.user,
          accessToken: responseModel.data?.tokens?.accessToken,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
