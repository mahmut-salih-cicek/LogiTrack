import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/dashboard_stats.dart';

part 'dashboard_stats_dto.g.dart';

@JsonSerializable()
class DashboardStatsDto {
  final int activeLoads;
  final double onTimePercentage;
  final int exceptionsCount;
  final int onlineDrivers;

  DashboardStatsDto({
    required this.activeLoads,
    required this.onTimePercentage,
    required this.exceptionsCount,
    required this.onlineDrivers,
  });

  factory DashboardStatsDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardStatsDtoToJson(this);

  DashboardStats toEntity() {
    return DashboardStats(
      activeLoads: activeLoads,
      onTimePercentage: onTimePercentage,
      exceptionsCount: exceptionsCount,
      onlineDrivers: onlineDrivers,
    );
  }
}

