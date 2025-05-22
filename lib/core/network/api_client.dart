import 'package:dio/dio.dart';
import 'package:fitted/core/constants/app_constants.dart';
import 'package:fitted/core/network/network_info.dart';
import 'package:fitted/core/network/token_provider.dart';

class ApiClient {
  final Dio _dio;
  final NetworkInfo networkInfo;

  ApiClient({
    required NetworkInfo networkInfo,
    required TokenProvider tokenProvider, // <-- Inject token provider
  })  : _dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )),
        networkInfo = networkInfo {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenProvider.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options); // continue
        },
      ),
    );
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Unknown Error');
    }
  }

  // Optional: Add GET, PUT, DELETE methods as well
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Unknown Error');
    }
  }

  Future<Response> putMultipart(
    String endpoint, {
    required FormData formData,
  }) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    try {
      final response = await _dio.put(endpoint, data: formData);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Unknown Error');
    }
  }
}
