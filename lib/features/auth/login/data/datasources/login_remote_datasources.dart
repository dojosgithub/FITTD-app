import 'package:fitted/features/auth/login/data/models/login_request_model.dart';
import 'package:fitted/features/auth/login/data/models/login_response_model.dart';

import '../../../../../core/network/api_client.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel model);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiClient apiClient;

  LoginRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel model) async {
    try {
      final response = await apiClient.post(
        '/api/auth/signin',
        data: model.toJson(),
      );

      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}
