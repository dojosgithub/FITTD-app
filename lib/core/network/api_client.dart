import 'package:dio/dio.dart';
import 'package:fitted/core/constants/app_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(dio)
      : _dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    // if (!await NetworkUtils.hasInternetConnection()) {
    //   return const Left(NetworkFailure("No internet connection"));
    // }
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Unknown Error');
    }
  }
}
