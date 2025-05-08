// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:fitted/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:fitted/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:fitted/features/auth/forgot_password/domain/repository/forgot_password_repository.dart';

import '../../../../../core/errors/failure.dart';

class ForgotPasswordUsecase {
  final ForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordUsecase(
    this.forgotPasswordRepository,
  );

  Future<Either<Failure, ForgotPasswordEntity>> call({
    required String email,
  }) async {
    return await forgotPasswordRepository.forgotPassword(
      ForgotPasswordRequest(
        email: email,
      ),
    );
  }
}
