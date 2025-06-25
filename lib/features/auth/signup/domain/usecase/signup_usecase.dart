import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../data/models/signup_request_model.dart';
import '../entities/signup_response.dart';
import '../repository/signup_repository.dart';

class SignUpUseCase {
  final SignUpRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, SignUpResponse>> call({
    required String name,
    required String email,
    required String password,
    required String fcmToken,
  }) async {
    return await repository.signUp(SignUpRequestModel(
      name: name,
      email: email,
      password: password,
      fcmToken: fcmToken,
    ));
  }
}
