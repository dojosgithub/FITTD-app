import 'package:fitted/core/network/api_client.dart';
import 'package:fitted/features/auth/verify_otp/data/models/email_verification_request.dart';
import 'package:fitted/features/auth/verify_otp/data/models/otp_verification_request.dart';
import 'package:fitted/features/auth/verify_otp/data/models/verification_response.dart';

abstract class VerificationRemoteDataSource {
  Future<VerificationResponse> verifyEmailOtp(EmailVerificationRequest model);
  Future<VerificationResponse> verifyOtp(OtpVerificationRequest model);
}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final ApiClient apiClient;

  VerificationRemoteDataSourceImpl(this.apiClient);

  Future<VerificationResponse> _verify(Map<String, dynamic> data) async {
    try {
      final response = await apiClient.post(
        '/api/auth/verify-otp',
        data: data,
      );
      return VerificationResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to verify OTP: ${e.toString()}');
    }
  }

  @override
  Future<VerificationResponse> verifyOtp(OtpVerificationRequest model) {
    return _verify(model.toJson());
  }

  @override
  Future<VerificationResponse> verifyEmailOtp(EmailVerificationRequest model) {
    print(model.toJson());
    return _verify(model.toJson());
  }
}
