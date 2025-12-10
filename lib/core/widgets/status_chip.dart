import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/radius.dart';
import '../design/spacing.dart';
import '../design/text_styles.dart';

enum LoadStatus {
  assigned,
  inTransit,
  atPickup,
  atDelivery,
  completed,
  exception,
}

class StatusChip extends StatelessWidget {
  final String label;
  final LoadStatus? status;
  final Color? color;
  final Color? backgroundColor;

  const StatusChip({
    super.key,
    required this.label,
    this.status,
    this.color,
    this.backgroundColor,
  });

  Color _getStatusColor(LoadStatus status) {
    switch (status) {
      case LoadStatus.assigned:
        return AppColors.statusAssigned;
      case LoadStatus.inTransit:
        return AppColors.statusInTransit;
      case LoadStatus.atPickup:
        return AppColors.statusAtPickup;
      case LoadStatus.atDelivery:
        return AppColors.statusAtDelivery;
      case LoadStatus.completed:
        return AppColors.statusCompleted;
      case LoadStatus.exception:
        return AppColors.statusException;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? (status != null ? _getStatusColor(status!) : AppColors.textSecondary);
    final chipBackground = backgroundColor ?? chipColor.withValues(alpha: 0.1);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: chipBackground,
        borderRadius: AppRadius.fullAll,
        border: Border.all(
          color: chipColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSmall.copyWith(
          color: chipColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

