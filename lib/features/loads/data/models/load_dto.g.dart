// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadDto _$LoadDtoFromJson(Map<String, dynamic> json) => LoadDto(
  id: json['id'] as String,
  loadNumber: json['loadNumber'] as String,
  status: json['status'] as String,
  assignedDriverId: json['assignedDriverId'] as String?,
  assignedDriverName: json['assignedDriverName'] as String?,
  pickupAddress: json['pickupAddress'] as String,
  deliveryAddress: json['deliveryAddress'] as String,
  pickupDateString: json['pickupDate'] as String,
  deliveryDateString: json['deliveryDate'] as String,
  createdAtString: json['createdAt'] as String,
  stops: (json['stops'] as List<dynamic>?)
      ?.map((e) => StopDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LoadDtoToJson(LoadDto instance) => <String, dynamic>{
  'id': instance.id,
  'loadNumber': instance.loadNumber,
  'status': instance.status,
  'assignedDriverId': instance.assignedDriverId,
  'assignedDriverName': instance.assignedDriverName,
  'pickupAddress': instance.pickupAddress,
  'deliveryAddress': instance.deliveryAddress,
  'pickupDate': instance.pickupDateString,
  'deliveryDate': instance.deliveryDateString,
  'createdAt': instance.createdAtString,
  'stops': instance.stops,
};
