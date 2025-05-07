import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import '../../data/models/login_request_model.dart';
import '../entities/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequestModel model);
}
