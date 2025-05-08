import 'package:fitted/features/auth/forgot_password/data/models/change_password_request.dart';
import 'package:fitted/features/auth/forgot_password/data/models/change_password_response.dart';
import 'package:fitted/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:fitted/features/auth/forgot_password/data/models/forgot_password_response.dart';

import '../../../../../core/network/api_client.dart';

abstract class ForgotPasswordRemoteDatasource {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest model);
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest model);
}

class ForgotPasswordRemoteDatasourceImpl
    implements ForgotPasswordRemoteDatasource {
  final ApiClient apiClient;

  ForgotPasswordRemoteDatasourceImpl(this.apiClient);

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest model) async {
    try {
      final response = await apiClient.post(
        '/api/auth/forgot-password',
        data: model.toJson(),
      );

      return ForgotPasswordResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Forgot password failed: ${e.toString()}');
    }
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest model) async {
    try {
      final response = await apiClient.post(
        '/api/auth/change-password',
        data: model.toJson(),
      );

      return ChangePasswordResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Forgot password failed: ${e.toString()}');
    }
  }
}
