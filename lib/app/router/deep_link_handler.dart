import 'package:go_router/go_router.dart';

class DeepLinkHandler {
  static void handleDeepLink(String link, GoRouter router) {
    // Parse deep link format: app://load/{id}, app://stop/{id}, app://incident/{id}
    final uri = Uri.parse(link);

    switch (uri.scheme) {
      case 'app':
        _handleAppScheme(uri, router);
        break;
      default:
        // Handle other schemes if needed
        break;
    }
  }

  static void _handleAppScheme(Uri uri, GoRouter router) {
    final path = uri.pathSegments;

    if (path.isEmpty) return;

    switch (path[0]) {
      case 'load':
        if (path.length > 1) {
          router.go('/load/${path[1]}');
        }
        break;
      case 'stop':
        if (path.length > 1) {
          router.go('/stop/${path[1]}');
        }
        break;
      case 'incident':
        if (path.length > 1) {
          router.go('/incident/${path[1]}');
        }
        break;
    }
  }
}

