import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/loads_repository.dart';
import '../../data/repositories/loads_repository_impl.dart';
import '../../data/datasources/loads_remote_datasource.dart';
import '../../../../app/di/dependency_injection.dart';

final loadsRepositoryProvider = Provider<LoadsRepository>((ref) {
  final remoteDataSource = LoadsRemoteDataSourceImpl(ref.watch(dioClientProvider).instance);
  final database = ref.watch(databaseProvider);
  return LoadsRepositoryImpl(remoteDataSource, database);
});

class LoadDetailPage extends ConsumerWidget {
  final String loadId;

  const LoadDetailPage({super.key, required this.loadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(loadsRepositoryProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'İş Detayı',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: repository.getLoadDetail(loadId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isFailure) {
            return const Center(child: Text('İş bulunamadı'));
          }

          final load = snapshot.data!.dataOrNull!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // İş Numarası ve Durum
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            load.loadNumber,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF111827),
                            ),
                          ),
                          StatusChip(label: load.status, status: null),
                        ],
                      ),
                      if (load.assignedDriverName != null) ...[
                        const SizedBox(height: AppSpacing.md),
                        _buildInfoRow(Icons.person_outline, 'Sürücü', load.assignedDriverName!),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.md),

                // Adresler
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Adres Bilgileri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      _buildAddressCard('Alış Adresi', load.pickupAddress, const Color(0xFF10B981)),
                      const SizedBox(height: AppSpacing.md),
                      _buildAddressCard('Teslim Adresi', load.deliveryAddress, const Color(0xFF3B82F6)),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.md),

                // Duraklar
                if (load.stops.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Duraklar (${load.stops.length})',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        ...load.stops.map((stop) {
                          final statusColor = stop.status == 'completed'
                              ? const Color(0xFF10B981)
                              : stop.status == 'in_progress'
                                  ? const Color(0xFFF59E0B)
                                  : Colors.grey[400]!;
                          
                          return Padding(
                            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: statusColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        stop.isPickup ? 'ALIŞ' : 'TESLİMAT',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        stop.address,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF374151),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF6B7280)),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressCard(String title, String address, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha(100)),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: color, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

