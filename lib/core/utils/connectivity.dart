import 'dart:async';

/// Simple connectivity checker
/// In production, use connectivity_plus package
class ConnectivityService {
  static bool _isConnected = true;

  static bool get isConnected => _isConnected;

  static final _connectivityController = StreamController<bool>.broadcast();
  static Stream<bool> get connectivityStream => _connectivityController.stream;

  static void setConnected(bool connected) {
    if (_isConnected != connected) {
      _isConnected = connected;
      _connectivityController.add(connected);
    }
  }

  static void dispose() {
    _connectivityController.close();
  }
}

