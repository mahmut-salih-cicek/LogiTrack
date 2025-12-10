import 'package:equatable/equatable.dart';

class PodEntity extends Equatable {
  final String id;
  final String stopId;
  final String loadId;
  final String? receiverName;
  final String? signaturePath;
  final List<String> photos;
  final String? notes;
  final List<String> packageScans;
  final double latitude;
  final double longitude;
  final DateTime createdAt;
  final bool isSynced;

  const PodEntity({
    required this.id,
    required this.stopId,
    required this.loadId,
    this.receiverName,
    this.signaturePath,
    required this.photos,
    this.notes,
    required this.packageScans,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    this.isSynced = false,
  });

  @override
  List<Object?> get props => [
        id,
        stopId,
        loadId,
        receiverName,
        signaturePath,
        photos,
        notes,
        packageScans,
        latitude,
        longitude,
        createdAt,
        isSynced,
      ];
}

