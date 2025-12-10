import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/stop.dart';

part 'stop_dto.g.dart';

@JsonSerializable()
class StopDto {
  final String id;
  final String type;
  final String address;
  final double latitude;
  final double longitude;
  final double geofenceRadius;
  final String status;
  @JsonKey(name: 'expectedArrival')
  final String? expectedArrivalString;
  @JsonKey(name: 'actualArrival')
  final String? actualArrivalString;
  @JsonKey(name: 'actualDeparture')
  final String? actualDepartureString;
  final String? notes;

  StopDto({
    required this.id,
    required this.type,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.geofenceRadius,
    required this.status,
    this.expectedArrivalString,
    this.actualArrivalString,
    this.actualDepartureString,
    this.notes,
  });

  factory StopDto.fromJson(Map<String, dynamic> json) => _$StopDtoFromJson(json);
  Map<String, dynamic> toJson() => _$StopDtoToJson(this);

  Stop toEntity(String loadId) {
    return Stop(
      id: id,
      loadId: loadId,
      type: type,
      address: address,
      latitude: latitude,
      longitude: longitude,
      geofenceRadius: geofenceRadius,
      status: status,
      expectedArrival: expectedArrivalString != null ? DateTime.parse(expectedArrivalString!) : null,
      actualArrival: actualArrivalString != null ? DateTime.parse(actualArrivalString!) : null,
      actualDeparture: actualDepartureString != null ? DateTime.parse(actualDepartureString!) : null,
      notes: notes,
    );
  }
}

