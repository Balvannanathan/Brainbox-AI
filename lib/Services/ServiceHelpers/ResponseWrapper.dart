class ApiResponse<T> {
  final ApiStatusCode statusCode;
  final T? data;
  final String message;
  final dynamic extra;

  ApiResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    this.extra,
  });

  /// Factory method to create response from Dio
  factory ApiResponse.fromDioResponse(
    dynamic response, {
    required T Function(dynamic json) fromJson,
  }) {
    return ApiResponse<T>(
      statusCode: mapStatusCode(response.statusCode),
      data: response.data != null ? fromJson(response.data) : null,
      message: response.statusMessage ?? '',
      extra: response.data,
    );
  }

  /// Error response
  factory ApiResponse.error({
    required int? statusCode,
    String? message,
    dynamic extra,
  }) {
    return ApiResponse<T>(
      statusCode: mapStatusCode(statusCode),
      data: null,
      message: message ?? 'Something went wrong',
      extra: extra,
    );
  }
}

enum ApiStatusCode {
  success,
  created,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  serverError,
  unknown,
}

ApiStatusCode mapStatusCode(int? code) {
  switch (code) {
    case 200:
      return ApiStatusCode.success;
    case 201:
      return ApiStatusCode.created;
    case 400:
      return ApiStatusCode.badRequest;
    case 401:
      return ApiStatusCode.unauthorized;
    case 403:
      return ApiStatusCode.forbidden;
    case 404:
      return ApiStatusCode.notFound;
    case 409:
      return ApiStatusCode.conflict;
    case 500:
      return ApiStatusCode.serverError;
    default:
      return ApiStatusCode.unknown;
  }
}
