import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';

import '../../data/models/email_verification_request.dart';
import '../../data/models/otp_verification_request.dart';
import '../entities/otp_response.dart';
import '../repositories/otp_repository.dart';

class VerifyEmailOtpUseCase {
  final OtpVerificationRepository repository;

  VerifyEmailOtpUseCase(this.repository);

  Future<Either<Failure, OtpVerificationResponse>> call({
    required String email,
    required String code,
  }) {
    final request = EmailVerificationRequest(email: email, code: code);
    return _verify(request, repository.verifyEmailOtp);
  }

  Future<Either<Failure, OtpVerificationResponse>> _verify<T>(
    T request,
    Future<Either<Failure, OtpVerificationResponse>> Function(T) method,
  ) {
    return method(request);
  }
}

class VerifyOtpUseCase {
  final OtpVerificationRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, OtpVerificationResponse>> call({
    required String email,
    required String code,
  }) {
    final request = OtpVerificationRequest(email: email, code: code);
    return _verify(request, repository.verifyOtp);
  }

  Future<Either<Failure, OtpVerificationResponse>> _verify<T>(
    T request,
    Future<Either<Failure, OtpVerificationResponse>> Function(T) method,
  ) {
    return method(request);
  }
}
