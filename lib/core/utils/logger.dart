import 'dart:developer' as developer;

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class AppLogger {
  static void log(
    String message, {
    LogLevel level = LogLevel.info,
    Object? error,
    StackTrace? stackTrace,
    String? tag,
  }) {
    final logTag = tag ?? 'App';
    final prefix = _getLevelPrefix(level);

    switch (level) {
      case LogLevel.debug:
        developer.log('$prefix $message', name: logTag);
        break;
      case LogLevel.info:
        developer.log('$prefix $message', name: logTag);
        break;
      case LogLevel.warning:
        developer.log('$prefix $message', name: logTag, level: 900);
        break;
      case LogLevel.error:
        developer.log(
          '$prefix $message',
          name: logTag,
          error: error,
          stackTrace: stackTrace,
          level: 1000,
        );
        break;
    }
  }

  static String _getLevelPrefix(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return '[DEBUG]';
      case LogLevel.info:
        return '[INFO]';
      case LogLevel.warning:
        return '[WARN]';
      case LogLevel.error:
        return '[ERROR]';
    }
  }

  static void debug(String message, {String? tag}) {
    log(message, level: LogLevel.debug, tag: tag);
  }

  static void info(String message, {String? tag}) {
    log(message, level: LogLevel.info, tag: tag);
  }

  static void warning(String message, {String? tag}) {
    log(message, level: LogLevel.warning, tag: tag);
  }

  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
  }) {
    log(
      message,
      level: LogLevel.error,
      error: error,
      stackTrace: stackTrace,
      tag: tag,
    );
  }
}

