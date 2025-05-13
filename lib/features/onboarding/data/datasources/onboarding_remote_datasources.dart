import '../../../../core/network/api_client.dart';
import '../models/onboarding_request_model.dart';
import '../models/onboarding_response_model.dart';

abstract class OnboardingRemoteDataSource {
  Future<OnboardingResponseModel> submitMeasurement(
      OnboardingRequestModel request);
}

class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSource {
  final ApiClient apiClient;

  OnboardingRemoteDataSourceImpl(this.apiClient);

  @override
  Future<OnboardingResponseModel> submitMeasurement(
      OnboardingRequestModel request) async {
    final response =
        await apiClient.post('/api/user/measurements', data: request.toJson());
    return OnboardingResponseModel.fromJson(response.data);
  }
}
