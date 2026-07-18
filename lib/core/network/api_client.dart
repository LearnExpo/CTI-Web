import 'package:dio/dio.dart';
import '../config/env.dart';
import 'api_exception.dart';

/// Thin wrapper around Dio — handles base URL, timeouts, auth headers,
/// logging, and maps every failure into an [ApiException] subtype so
/// repositories only ever deal with one exception hierarchy.
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Attach an auth token here once you add authentication:
          // final token = AuthStorage.token;
          // if (token != null) options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
        onError: (error, handler) {
          handler.next(error); // rethrown as DioException; mapped below
        },
      ),
    );

    if (Env.current != Environment.production) {
      _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) {
    return _wrap(() => _dio.get<T>(path, queryParameters: queryParameters));
  }

  Future<Response<T>> post<T>(String path, {Object? data}) {
    return _wrap(() => _dio.post<T>(path, data: data));
  }

  Future<Response<T>> put<T>(String path, {Object? data}) {
    return _wrap(() => _dio.put<T>(path, data: data));
  }

  Future<Response<T>> delete<T>(String path) {
    return _wrap(() => _dio.delete<T>(path));
  }

  Future<Response<T>> _wrap<T>(Future<Response<T>> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  ApiException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutExceptionApi();
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        if (status == 401) return const UnauthorizedException();
        final message = e.response?.data is Map
            ? (e.response?.data['message']?.toString() ?? 'Something went wrong.')
            : 'Something went wrong.';
        return ServerException(message, statusCode: status);
      default:
        return ApiException(e.message ?? 'Unexpected error occurred.');
    }
  }
}