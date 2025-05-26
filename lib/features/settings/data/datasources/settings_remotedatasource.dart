import 'package:fitted/core/network/api_client.dart';
import 'package:fitted/features/settings/data/models/delete_account_request_model.dart';

import '../models/change_password_request_model.dart';

abstract class SettingsRemoteDataSource {
  Future changePassword(ChangePasswordRequestModel request);
  Future deleteAccount(DeleteAccountRequestModel request);
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

  @override
  Future deleteAccount(DeleteAccountRequestModel request) async {
    final response = await apiClient.delete(
      '/api/auth/delete-account',
      data: request.toJson(),
    );
    print(response.data);
    return response.data;
  }
}
