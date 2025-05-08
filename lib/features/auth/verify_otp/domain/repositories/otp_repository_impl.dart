import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/auth/verify_otp/data/models/email_verification_request.dart';
import 'package:fitted/features/auth/verify_otp/data/models/otp_verification_request.dart';
import 'package:fitted/features/auth/verify_otp/domain/entities/otp_response.dart';
import 'package:fitted/features/auth/verify_otp/domain/repositories/otp_repository.dart';
import '../../data/datasources/verfication_remote_datasources.dart';
import '../../data/models/verification_response.dart';

class OtpVerificationRepositoryImpl implements OtpVerificationRepository {
  final VerificationRemoteDataSource dataSource;

  OtpVerificationRepositoryImpl(this.dataSource);

  Future<Either<Failure, OtpVerificationResponse>> _verify<T>(
    Future<VerificationResponse> Function(T model) method,
    T model,
  ) async {
    try {
      final responseModel = await method(model);
      return Right(OtpVerificationResponse(message: responseModel.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OtpVerificationResponse>> verifyEmailOtp(
      EmailVerificationRequest model) {
    return _verify(dataSource.verifyEmailOtp, model);
  }

  @override
  Future<Either<Failure, OtpVerificationResponse>> verifyOtp(
      OtpVerificationRequest model) {
    return _verify(dataSource.verifyOtp, model);
  }
}
