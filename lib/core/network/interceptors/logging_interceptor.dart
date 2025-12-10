import 'package:dio/dio.dart';
import '../../utils/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    final path = options.path;
    final queryParams = options.queryParameters;
    final headers = _sanitizeHeaders(options.headers);

    AppLogger.debug(
      '→ $method $path${queryParams.isNotEmpty ? '?$queryParams' : ''}',
      tag: 'Network',
    );
    if (options.data != null) {
      AppLogger.debug('Request body: ${options.data}', tag: 'Network');
    }
    if (headers.isNotEmpty) {
      AppLogger.debug('Headers: $headers', tag: 'Network');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final path = response.requestOptions.path;

    AppLogger.info(
      '← $statusCode $path',
      tag: 'Network',
    );
    if (response.data != null) {
      AppLogger.debug('Response: ${response.data}', tag: 'Network');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    final message = err.message;

    AppLogger.error(
      '✗ $statusCode $path: $message',
      error: err,
      stackTrace: err.stackTrace,
      tag: 'Network',
    );

    handler.next(err);
  }

  Map<String, dynamic> _sanitizeHeaders(Map<String, dynamic> headers) {
    final sanitized = Map<String, dynamic>.from(headers);
    
    // Redact sensitive headers
    if (sanitized.containsKey('Authorization')) {
      sanitized['Authorization'] = 'Bearer ***';
    }
    if (sanitized.containsKey('authorization')) {
      sanitized['authorization'] = 'Bearer ***';
    }

    return sanitized;
  }
}

