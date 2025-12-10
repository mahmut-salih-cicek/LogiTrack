import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/empty_state.dart';
import '../providers/route_provider.dart';
import '../widgets/route_map_widget.dart';
import '../widgets/route_bottom_sheet.dart';

class DriverRoutePage extends ConsumerWidget {
  const DriverRoutePage({super.key});

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
    final routeAsync = ref.watch(routeProvider);
    final today = _getTurkishDate();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Rota',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF111827), // Dark gray, not black
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF6B7280), // Medium gray
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                today,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151), // Slightly lighter gray
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
        // Settings button moved to map controls
        actions: const [],
      ),
      body: routeAsync.when(
        data: (stops) {
          if (stops.isEmpty) {
            return const EmptyState(
              icon: Icons.route,
              title: 'Henüz rota yok',
              message: 'Bugün için atanmış rota bulunmamaktadır',
            );
          }

          return Stack(
            children: [
              // Map takes full screen
              Positioned.fill(
                child: const RouteMapWidget(),
              ),
              // Bottom sheet positioned at bottom
              Positioned.fill(
                child: RouteBottomSheet(stops: stops),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hata: $error'),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Tekrar Dene',
                onPressed: () => ref.read(routeProvider.notifier).loadRoute(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

