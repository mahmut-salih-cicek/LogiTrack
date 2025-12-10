import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design/colors.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/design/text_styles.dart';
import '../../../../core/design/radius.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../domain/entities/load.dart';

class LoadCard extends StatelessWidget {
  final Load load;

  const LoadCard({super.key, required this.load});

  LoadStatus? _getStatus() {
    switch (load.status) {
      case 'assigned':
        return LoadStatus.assigned;
      case 'in_transit':
        return LoadStatus.inTransit;
      case 'at_pickup':
        return LoadStatus.atPickup;
      case 'at_delivery':
        return LoadStatus.atDelivery;
      case 'completed':
        return LoadStatus.completed;
      case 'exception':
        return LoadStatus.exception;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => context.push('/load/${load.id}'),
        borderRadius: AppRadius.mdAll,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    load.loadNumber,
                    style: AppTextStyles.titleMedium,
                  ),
                  StatusChip(
                    label: load.status,
                    status: _getStatus(),
                  ),
                ],
              ),
              if (load.assignedDriverName != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Sürücü: ${load.assignedDriverName}',
                  style: AppTextStyles.bodySmall,
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      load.pickupAddress,
                      style: AppTextStyles.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: AppColors.primary),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      load.deliveryAddress,
                      style: AppTextStyles.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

