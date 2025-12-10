import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/skeleton_loader.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/loads_repository.dart';
import '../../data/repositories/loads_repository_impl.dart';
import '../../data/datasources/loads_remote_datasource.dart';
import '../../../../app/di/dependency_injection.dart';
import '../widgets/load_card.dart';

final loadsRepositoryProvider = Provider<LoadsRepository>((ref) {
  final remoteDataSource = LoadsRemoteDataSourceImpl(ref.watch(dioClientProvider).instance);
  final database = ref.watch(databaseProvider);
  return LoadsRepositoryImpl(remoteDataSource, database);
});

class LoadsListPage extends ConsumerWidget {
  const LoadsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(loadsRepositoryProvider);

    return FutureBuilder(
      future: repository.getLoads(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              SkeletonCard(),
              SizedBox(height: AppSpacing.md),
              SkeletonCard(),
            ],
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isFailure) {
          return const EmptyState(
            icon: Icons.error_outline,
            title: 'Yükler yüklenemedi',
          );
        }

        final loads = snapshot.data!.dataOrNull ?? [];

        if (loads.isEmpty) {
          return const EmptyState(
            icon: Icons.local_shipping,
            title: 'Henüz yük yok',
            message: 'Atanmış yük bulunmamaktadır',
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: loads.length,
          separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (context, index) {
            return LoadCard(load: loads[index]);
          },
        );
      },
    );
  }
}

