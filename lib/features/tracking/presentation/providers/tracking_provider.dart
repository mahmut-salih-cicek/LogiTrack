import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class TrackingState {
  final bool isTracking;
  final Position? currentPosition;
  final double? accuracy;

  TrackingState({
    this.isTracking = false,
    this.currentPosition,
    this.accuracy,
  });

  TrackingState copyWith({
    bool? isTracking,
    Position? currentPosition,
    double? accuracy,
  }) {
    return TrackingState(
      isTracking: isTracking ?? this.isTracking,
      currentPosition: currentPosition ?? this.currentPosition,
      accuracy: accuracy ?? this.accuracy,
    );
  }
}

class TrackingNotifier extends StateNotifier<TrackingState> {
  TrackingNotifier() : super(TrackingState());

  Future<void> startTracking() async {
    state = state.copyWith(isTracking: true);
    // Start background location tracking
  }

  Future<void> stopTracking() async {
    state = state.copyWith(isTracking: false);
  }
}

final trackingProvider = StateNotifierProvider<TrackingNotifier, TrackingState>((ref) {
  return TrackingNotifier();
});

