import 'package:equatable/equatable.dart';

/// Base failure class
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Network related failures
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

/// Storage related failures
class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Authentication related failures
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Permission related failures
class PermissionFailure extends Failure {
  const PermissionFailure(super.message);
}

/// Generic failure
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

