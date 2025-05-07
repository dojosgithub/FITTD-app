import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/login/data/models/login_request_model.dart';
import 'package:fitted/features/auth/login/domain/entities/login_response.dart';
import 'package:fitted/features/auth/login/domain/respository/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginResponse>> call({
    required String email,
    required String password,
  }) async {
    return await repository.login(LoginRequestModel(
      email: email,
      password: password,
    ));
  }
}
