import 'package:brainbox_ai/Helpers/AppConstants/AppConstants.dart';
import 'package:dio/dio.dart';

class RequestWrapper {
  static Dio? _dio;

  /// Initialize Dio instance
  static Dio getDio({String? authToken}) {
    if (_dio != null) return _dio!;

    final BaseOptions options = BaseOptions(
      baseUrl: Appconstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      },
    );

    _dio = Dio(options);

    /// Interceptors (Logging, Error Handling, Token Refresh, etc.)
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // You can modify headers here if needed
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    return _dio!;
  }

  /// Clear instance (useful on logout)
  static void reset() {
    _dio = null;
  }
}
