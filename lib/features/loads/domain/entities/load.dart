import 'package:equatable/equatable.dart';
import 'stop.dart';

class Load extends Equatable {
  final String id;
  final String loadNumber;
  final String status; // assigned, in_transit, at_pickup, at_delivery, completed, exception
  final String? assignedDriverId;
  final String? assignedDriverName;
  final String pickupAddress;
  final String deliveryAddress;
  final DateTime pickupDate;
  final DateTime deliveryDate;
  final DateTime createdAt;
  final List<Stop> stops;

  const Load({
    required this.id,
    required this.loadNumber,
    required this.status,
    this.assignedDriverId,
    this.assignedDriverName,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.pickupDate,
    required this.deliveryDate,
    required this.createdAt,
    this.stops = const [],
  });

  @override
  List<Object?> get props => [
        id,
        loadNumber,
        status,
        assignedDriverId,
        assignedDriverName,
        pickupAddress,
        deliveryAddress,
        pickupDate,
        deliveryDate,
        createdAt,
        stops,
      ];
}

