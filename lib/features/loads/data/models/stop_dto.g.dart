// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopDto _$StopDtoFromJson(Map<String, dynamic> json) => StopDto(
  id: json['id'] as String,
  type: json['type'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  geofenceRadius: (json['geofenceRadius'] as num).toDouble(),
  status: json['status'] as String,
  expectedArrivalString: json['expectedArrival'] as String?,
  actualArrivalString: json['actualArrival'] as String?,
  actualDepartureString: json['actualDeparture'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$StopDtoToJson(StopDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'geofenceRadius': instance.geofenceRadius,
  'status': instance.status,
  'expectedArrival': instance.expectedArrivalString,
  'actualArrival': instance.actualArrivalString,
  'actualDeparture': instance.actualDepartureString,
  'notes': instance.notes,
};
