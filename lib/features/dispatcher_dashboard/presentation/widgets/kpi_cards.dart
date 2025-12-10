import 'package:flutter/material.dart';
import '../../../../core/design/colors.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/design/text_styles.dart';
import '../../../../core/design/radius.dart';
import '../../../../core/design/shadows.dart';
import '../../domain/entities/dashboard_stats.dart';

class KpiCards extends StatelessWidget {
  final DashboardStats stats;

  const KpiCards({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSpacing.md,
      mainAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.5,
      children: [
        _KpiCard(
          title: 'Aktif Yükler',
          value: stats.activeLoads.toString(),
          icon: Icons.local_shipping,
          color: AppColors.primary,
        ),
        _KpiCard(
          title: 'Zamanında %',
          value: '${stats.onTimePercentage.toStringAsFixed(1)}%',
          icon: Icons.schedule,
          color: AppColors.success,
        ),
        _KpiCard(
          title: 'İstisnalar',
          value: stats.exceptionsCount.toString(),
          icon: Icons.warning,
          color: AppColors.warning,
        ),
        _KpiCard(
          title: 'Online Sürücüler',
          value: stats.onlineDrivers.toString(),
          icon: Icons.person,
          color: AppColors.info,
        ),
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _KpiCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.mdAll,
        boxShadow: AppShadows.md,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTextStyles.headlineMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                title,
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

