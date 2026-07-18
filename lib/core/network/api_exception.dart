class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class NetworkException extends ApiException {
  const NetworkException() : super('No internet connection. Please try again.');
}

class TimeoutExceptionApi extends ApiException {
  const TimeoutExceptionApi() : super('The request timed out. Please try again.');
}

class ServerException extends ApiException {
  const ServerException(super.message, {super.statusCode});
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException() : super('Session expired. Please log in again.', statusCode: 401);
}