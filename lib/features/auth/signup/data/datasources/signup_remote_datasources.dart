import '../../../../../core/network/api_client.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

abstract class SignUpRemoteDataSource {
  Future<SignUpResponseModel> signUp(SignUpRequestModel model);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiClient apiClient;

  SignUpRemoteDataSourceImpl(this.apiClient);

  @override
  Future<SignUpResponseModel> signUp(SignUpRequestModel model) async {
    try {
      final response = await apiClient.post(
        '/api/auth/signup',
        data: model.toJson(),
      );

      return SignUpResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
  }
}
