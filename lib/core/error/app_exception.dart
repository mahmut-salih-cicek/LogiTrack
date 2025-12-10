import 'failures.dart';

/// Base exception class
abstract class AppException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? stackTrace;

  const AppException(
    this.message, {
    this.originalError,
    this.stackTrace,
  });
}

/// Network exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, {super.originalError, super.stackTrace});
}

class ServerException extends AppException {
  final int? statusCode;
  
  const ServerException(
    super.message, {
    this.statusCode,
    super.originalError,
    super.stackTrace,
  });
}

class TimeoutException extends AppException {
  const TimeoutException(super.message, {super.originalError, super.stackTrace});
}

/// Storage exceptions
class StorageException extends AppException {
  const StorageException(super.message, {super.originalError, super.stackTrace});
}

/// Auth exceptions
class AuthException extends AppException {
  const AuthException(super.message, {super.originalError, super.stackTrace});
}

/// Permission exceptions
class PermissionException extends AppException {
  const PermissionException(super.message, {super.originalError, super.stackTrace});
}

/// Converts exceptions to failures
Failure exceptionToFailure(AppException exception) {
  if (exception is NetworkException) {
    return NetworkFailure(exception.message);
  } else if (exception is ServerException) {
    return ServerFailure(exception.message);
  } else if (exception is TimeoutException) {
    return TimeoutFailure(exception.message);
  } else if (exception is StorageException) {
    return StorageFailure(exception.message);
  } else if (exception is AuthException) {
    return AuthFailure(exception.message);
  } else if (exception is PermissionException) {
    return PermissionFailure(exception.message);
  } else {
    return UnknownFailure(exception.message);
  }
}

