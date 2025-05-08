import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/forgot_password/data/datasources/forgot_password_remote_datasource.dart';
import 'package:fitted/features/auth/forgot_password/data/models/change_password_request.dart';
import 'package:fitted/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:fitted/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:fitted/features/auth/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDatasource forgotPasswordRemoteDatasource;

  ForgotPasswordRepositoryImpl(this.forgotPasswordRemoteDatasource);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword(
      ForgotPasswordRequest model) async {
    try {
      final responseModel =
          await forgotPasswordRemoteDatasource.forgotPassword(model);
      return Right(ForgotPasswordEntity(message: responseModel.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordEntity>> changePassword(
      ChangePasswordRequest model) async {
    try {
      final responseModel =
          await forgotPasswordRemoteDatasource.changePassword(model);
      return Right(ForgotPasswordEntity(message: responseModel.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
