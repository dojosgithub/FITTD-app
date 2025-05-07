import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import '../../data/models/signup_request_model.dart';
import '../entities/signup_response.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequestModel model);
}
