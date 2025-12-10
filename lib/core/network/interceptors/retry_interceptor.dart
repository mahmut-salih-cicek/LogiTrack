import 'package:dio/dio.dart';
import '../../utils/logger.dart';

class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && err.requestOptions.extra['retryCount'] == null) {
      err.requestOptions.extra['retryCount'] = 0;
    }

    final retryCount = err.requestOptions.extra['retryCount'] as int? ?? 0;

    if (retryCount < maxRetries && _shouldRetry(err)) {
      err.requestOptions.extra['retryCount'] = retryCount + 1;
      
      final delay = Duration(
        milliseconds: retryDelay.inMilliseconds * (retryCount + 1),
      );

      AppLogger.info(
        'Retrying request (${retryCount + 1}/$maxRetries): ${err.requestOptions.path}',
        tag: 'RetryInterceptor',
      );

      await Future.delayed(delay);

      try {
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        if (e is DioException) {
          handler.next(e);
        } else {
          handler.next(err);
        }
        return;
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    // Retry on network errors or 5xx server errors
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final dio = Dio();
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }
}

