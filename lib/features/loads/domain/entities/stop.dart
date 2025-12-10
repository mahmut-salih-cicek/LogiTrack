import 'package:equatable/equatable.dart';

class Stop extends Equatable {
  final String id;
  final String loadId;
  final String type; // pickup or delivery
  final String address;
  final double latitude;
  final double longitude;
  final double geofenceRadius;
  final String status; // pending, in_progress, completed
  final DateTime? expectedArrival;
  final DateTime? actualArrival;
  final DateTime? actualDeparture;
  final String? notes;

  const Stop({
    required this.id,
    required this.loadId,
    required this.type,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.geofenceRadius,
    required this.status,
    this.expectedArrival,
    this.actualArrival,
    this.actualDeparture,
    this.notes,
  });

  bool get isPickup => type == 'pickup';
  bool get isDelivery => type == 'delivery';
  bool get isCompleted => status == 'completed';

  @override
  List<Object?> get props => [
        id,
        loadId,
        type,
        address,
        latitude,
        longitude,
        geofenceRadius,
        status,
        expectedArrival,
        actualArrival,
        actualDeparture,
        notes,
      ];
}

