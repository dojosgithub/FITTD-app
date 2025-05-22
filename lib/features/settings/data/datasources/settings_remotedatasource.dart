import 'package:fitted/core/network/api_client.dart';

import '../models/change_password_request_model.dart';

abstract class SettingsRemoteDataSource {
  Future changePassword(ChangePasswordRequestModel request);
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final ApiClient apiClient;

  SettingsRemoteDataSourceImpl(this.apiClient);

  @override
  Future changePassword(ChangePasswordRequestModel request) async {
    final response = await apiClient.post(
      '/api/auth/change-password',
      data: request.toJson(),
    );
    return response.data;
  }
}
