import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/error_state.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/dispatcher_map_widget.dart';
import '../widgets/dispatcher_bottom_sheet.dart';

class DispatcherDashboardPage extends ConsumerWidget {
  const DispatcherDashboardPage({super.key});

  String _getTurkishDate() {
    final now = DateTime.now();
    const months = [
      'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran',
      'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'
    ];
    return '${now.day} ${months[now.month - 1]} ${now.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardProvider);
    final today = _getTurkishDate();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Operasyon Merkezi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF111827),
                  letterSpacing: 0.3,
                ),
              ),
              Text(
                today,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6B7280),
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Color(0xFF1F2937)),
              onPressed: () => context.push('/settings'),
            ),
          ),
        ],
      ),
      body: statsAsync.when(
        data: (stats) {
          return Stack(
            children: [
              // Map takes full screen
              const Positioned.fill(
                child: DispatcherMapWidget(),
              ),
              // Bottom sheet with stats and loads
              Positioned.fill(
                child: DispatcherBottomSheet(stats: stats),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: ErrorState(
            message: error.toString(),
            onRetry: () => ref.read(dashboardProvider.notifier).loadStats(),
          ),
        ),
      ),
    );
  }
}
