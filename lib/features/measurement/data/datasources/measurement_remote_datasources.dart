import '../../../../core/network/api_client.dart';
import '../models/measurement_request_model.dart';
import '../models/measurement_response_model.dart';

abstract class MeasurementRemoteDataSource {
  Future<MeasurementResponseModel> submitMeasurement(
      MeasurementRequestModel request);
  Future<MeasurementResponseModel> getMeasurement();
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

  @override
  Future<MeasurementResponseModel> getMeasurement() async {
    final response = await apiClient.get('/api/user/measurements');
    return MeasurementResponseModel.fromJson(response.data);
  }
}
