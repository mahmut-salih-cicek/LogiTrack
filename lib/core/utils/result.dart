import '../error/failures.dart';

/// Result type for handling success/failure states
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class FailureResult<T> extends Result<T> {
  final Failure failure;

  const FailureResult(this.failure);
}

/// Extension methods for Result
extension ResultExtensions<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => switch (this) {
        Success(data: final data) => data,
        FailureResult() => null,
      };

  Failure? get failureOrNull => switch (this) {
        Success() => null,
        FailureResult(failure: final failure) => failure,
      };

  Result<R> map<R>(R Function(T) mapper) {
    return switch (this) {
      Success(data: final data) => Success(mapper(data)),
      FailureResult(failure: final failure) => FailureResult<R>(failure),
    };
  }

  Result<R> flatMap<R>(Result<R> Function(T) mapper) {
    return switch (this) {
      Success(data: final data) => mapper(data),
      FailureResult(failure: final failure) => FailureResult<R>(failure),
    };
  }
}

