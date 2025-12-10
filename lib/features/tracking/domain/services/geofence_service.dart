import 'dart:math';

class GeofenceService {
  /// Check if location is within geofence radius
  static bool isWithinGeofence({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    required double radiusMeters,
  }) {
    final distance = _calculateDistance(lat1, lon1, lat2, lon2);
    return distance <= radiusMeters;
  }

  /// Calculate distance between two points in meters (Haversine formula)
  static double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // meters
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }
}

