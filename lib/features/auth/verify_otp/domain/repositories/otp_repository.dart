import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/verify_otp/data/models/email_verification_request.dart';
import 'package:fitted/features/auth/verify_otp/data/models/otp_verification_request.dart';
import 'package:fitted/features/auth/verify_otp/domain/entities/otp_response.dart';

abstract class OtpVerificationRepository {
  Future<Either<Failure, OtpVerificationResponse>> verifyOtp(
      OtpVerificationRequest model);
  Future<Either<Failure, OtpVerificationResponse>> verifyEmailOtp(
      EmailVerificationRequest model);
}
