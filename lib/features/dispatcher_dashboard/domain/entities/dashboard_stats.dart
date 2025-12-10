import 'package:equatable/equatable.dart';

class DashboardStats extends Equatable {
  final int activeLoads;
  final double onTimePercentage;
  final int exceptionsCount;
  final int onlineDrivers;

  const DashboardStats({
    required this.activeLoads,
    required this.onTimePercentage,
    required this.exceptionsCount,
    required this.onlineDrivers,
  });

  @override
  List<Object> get props => [activeLoads, onTimePercentage, exceptionsCount, onlineDrivers];
}

