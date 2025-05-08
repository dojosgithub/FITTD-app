import 'package:dartz/dartz.dart';
import 'package:fitted/features/auth/forgot_password/data/models/change_password_request.dart';
import 'package:fitted/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:fitted/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';

import '../../../../../core/errors/failure.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword(
    ForgotPasswordRequest model,
  );
  Future<Either<Failure, ForgotPasswordEntity>> changePassword(
    ChangePasswordRequest model,
  );
}
