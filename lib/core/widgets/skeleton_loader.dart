import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../design/colors.dart';
import '../design/radius.dart';
import '../design/spacing.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.surfaceVariant,
      highlightColor: AppColors.surface,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: borderRadius ?? AppRadius.smAll,
        ),
      ),
    );
  }
}

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.mdAll,
        side: BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(
              width: double.infinity,
              height: 20,
            ),
            const SizedBox(height: AppSpacing.sm),
            SkeletonLoader(
              width: 150,
              height: 16,
            ),
            const SizedBox(height: AppSpacing.md),
            SkeletonLoader(
              width: double.infinity,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

