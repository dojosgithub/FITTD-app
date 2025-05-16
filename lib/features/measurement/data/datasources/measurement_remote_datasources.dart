import '../../../../core/network/api_client.dart';
import '../models/measurement_request_model.dart';
import '../models/measurement_response_model.dart';

abstract class MeasurementRemoteDataSource {
  Future<MeasurementResponseModel> submitMeasurement(
      MeasurementRequestModel request);
}

class MeasurementRemoteDataSourceImpl implements MeasurementRemoteDataSource {
  final ApiClient apiClient;

  MeasurementRemoteDataSourceImpl(this.apiClient);

  @override
  Future<MeasurementResponseModel> submitMeasurement(
      MeasurementRequestModel request) async {
    final response =
        await apiClient.post('/api/user/measurements', data: request.toJson());
    return MeasurementResponseModel.fromJson(response.data);
  }
}
