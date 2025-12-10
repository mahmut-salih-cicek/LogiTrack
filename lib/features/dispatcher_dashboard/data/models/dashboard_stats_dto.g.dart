// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStatsDto _$DashboardStatsDtoFromJson(Map<String, dynamic> json) =>
    DashboardStatsDto(
      activeLoads: (json['activeLoads'] as num).toInt(),
      onTimePercentage: (json['onTimePercentage'] as num).toDouble(),
      exceptionsCount: (json['exceptionsCount'] as num).toInt(),
      onlineDrivers: (json['onlineDrivers'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardStatsDtoToJson(DashboardStatsDto instance) =>
    <String, dynamic>{
      'activeLoads': instance.activeLoads,
      'onTimePercentage': instance.onTimePercentage,
      'exceptionsCount': instance.exceptionsCount,
      'onlineDrivers': instance.onlineDrivers,
    };
