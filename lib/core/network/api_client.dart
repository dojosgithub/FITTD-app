import 'package:dio/dio.dart';
import 'package:fitted/core/constants/app_constants.dart';
import 'package:fitted/core/network/network_info.dart';
import 'package:fitted/core/network/token_provider.dart';

class ApiClient {
  final Dio _dio;
  final NetworkInfo networkInfo;

  ApiClient({
    required this.networkInfo,
    required TokenProvider tokenProvider,
  }) : _dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )) {
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

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Unknown Error');
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Unknown Error');
    }
  }
}
