import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/design/colors.dart';
import '../../../../core/design/text_styles.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/widgets/bottom_sheet_header.dart';
import '../../domain/entities/route_stop.dart';

class RouteBottomSheet extends StatelessWidget {
  final List<RouteStop> stops;

  const RouteBottomSheet({super.key, required this.stops});

  @override
  Widget build(BuildContext context) {
    // Sort stops by expected arrival for proper sequencing
    final sortedStops = List<RouteStop>.from(stops)
      ..sort((a, b) {
        if (a.expectedArrival == null) return 1;
        if (b.expectedArrival == null) return -1;
        return a.expectedArrival!.compareTo(b.expectedArrival!);
      });

    final completedCount = sortedStops.where((s) => s.status == 'completed').length;
    final inProgressCount = sortedStops.where((s) => s.status == 'in_progress').length;
    final pendingCount = sortedStops.where((s) => s.status == 'pending').length;

    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.12,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: const [0.12, 0.35, 0.85],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255 * 0.1).round()),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // Drag handle - this will drag the sheet
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
              // Header
              SliverToBoxAdapter(
                child: BottomSheetHeader(
                  title: sortedStops.isNotEmpty ? sortedStops.first.loadNumber : 'İş Rotası',
                  subtitle: '$completedCount tamamlandı • $inProgressCount devam ediyor • $pendingCount bekliyor',
                ),
              ),
              // Stops list
              SliverPadding(
                padding: EdgeInsets.all(AppSpacing.md),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      // Handle separators
                      final stopIndex = index ~/ 2;
                      if (index.isOdd) {
                        // Separator
                        return _RouteConnector();
                      }
                      // Stop item
                      if (stopIndex >= sortedStops.length) return null;
                      final stop = sortedStops[stopIndex];
                      return _StopListItem(
                        stop: stop,
                        sequenceNumber: stopIndex + 1,
                      );
                    },
                    childCount: sortedStops.length * 2 - 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RouteConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 31),
      child: Column(
        children: [
          Container(
            width: 2,
            height: 8,
            color: AppColors.border,
          ),
          Icon(Icons.arrow_downward, size: 16, color: AppColors.textTertiary),
          Container(
            width: 2,
            height: 8,
            color: AppColors.border,
          ),
        ],
      ),
    );
  }
}

class _StopListItem extends StatelessWidget {
  final RouteStop stop;
  final int sequenceNumber;

  const _StopListItem({
    required this.stop,
    required this.sequenceNumber,
  });

  Color _getStatusColor() {
    switch (stop.status) {
      case 'completed':
        return AppColors.success; // Yeşil
      case 'in_progress':
        return AppColors.warning; // Turuncu
      case 'pending':
      default:
        return AppColors.error; // Kırmızı
    }
  }

  String _getStatusText() {
    switch (stop.status) {
      case 'completed':
        return 'Tamamlandı';
      case 'in_progress':
        return 'Devam Ediyor';
      case 'pending':
      default:
        return 'Bekliyor';
    }
  }

  IconData _getStatusIcon() {
    switch (stop.status) {
      case 'completed':
        return Icons.check_circle;
      case 'in_progress':
        return Icons.local_shipping;
      case 'pending':
      default:
        return Icons.schedule;
    }
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '--:--';
    return DateFormat('HH:mm').format(dateTime);
  }

  String _getTimeLabel() {
    if (stop.status == 'completed' && stop.actualDeparture != null) {
      return 'Çıkış: ${_formatTime(stop.actualDeparture)}';
    } else if (stop.status == 'in_progress' && stop.actualArrival != null) {
      return 'Varış: ${_formatTime(stop.actualArrival)}';
    } else if (stop.expectedArrival != null) {
      return 'Tahmini: ${_formatTime(stop.expectedArrival)}';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();

    return InkWell(
      onTap: () {
        context.push('/stop/${stop.id}').then((_) {
          // Refresh route if needed after returning
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: stop.status == 'in_progress' 
                ? AppColors.warning.withAlpha((255 * 0.5).round()) 
                : AppColors.border,
            width: stop.status == 'in_progress' ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status indicator (colored circle with number)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: stop.status == 'completed'
                    ? Icon(Icons.check, color: Colors.white, size: 24)
                    : Text(
                        '$sequenceNumber',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            SizedBox(width: AppSpacing.md),
            // Stop details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        stop.isPickup ? Icons.upload : Icons.download,
                        size: 16,
                        color: stop.isPickup ? AppColors.info : AppColors.success,
                      ),
                      SizedBox(width: 4),
                      Text(
                        stop.isPickup ? 'ALIŞ' : 'TESLİMAT',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: stop.isPickup ? AppColors.info : AppColors.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          stop.loadNumber,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    stop.address,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(_getStatusIcon(), size: 14, color: statusColor),
                      SizedBox(width: 4),
                      Text(
                        _getStatusText(),
                        style: AppTextStyles.labelSmall.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_getTimeLabel().isNotEmpty) ...[
                        SizedBox(width: 8),
                        Icon(Icons.access_time, size: 14, color: AppColors.textSecondary),
                        SizedBox(width: 4),
                        Text(
                          _getTimeLabel(),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (stop.notes != null && stop.notes!.isNotEmpty) ...[
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.info.withAlpha((255 * 0.1).round()),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, size: 12, color: AppColors.info),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              stop.notes!,
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.info,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}

