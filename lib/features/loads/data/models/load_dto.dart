import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/load.dart';
import 'stop_dto.dart';

part 'load_dto.g.dart';

@JsonSerializable()
class LoadDto {
  final String id;
  final String loadNumber;
  final String status;
  final String? assignedDriverId;
  final String? assignedDriverName;
  final String pickupAddress;
  final String deliveryAddress;
  @JsonKey(name: 'pickupDate')
  final String pickupDateString;
  @JsonKey(name: 'deliveryDate')
  final String deliveryDateString;
  @JsonKey(name: 'createdAt')
  final String createdAtString;
  final List<StopDto>? stops;

  LoadDto({
    required this.id,
    required this.loadNumber,
    required this.status,
    this.assignedDriverId,
    this.assignedDriverName,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.pickupDateString,
    required this.deliveryDateString,
    required this.createdAtString,
    this.stops,
  });

  factory LoadDto.fromJson(Map<String, dynamic> json) => _$LoadDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoadDtoToJson(this);

  Load toEntity() {
    return Load(
      id: id,
      loadNumber: loadNumber,
      status: status,
      assignedDriverId: assignedDriverId,
      assignedDriverName: assignedDriverName,
      pickupAddress: pickupAddress,
      deliveryAddress: deliveryAddress,
      pickupDate: DateTime.parse(pickupDateString),
      deliveryDate: DateTime.parse(deliveryDateString),
      createdAt: DateTime.parse(createdAtString),
      stops: stops?.map((s) => s.toEntity(id)).toList() ?? [],
    );
  }
}

