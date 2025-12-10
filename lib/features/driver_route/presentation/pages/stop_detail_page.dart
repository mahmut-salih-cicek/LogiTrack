import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/design/text_styles.dart';
import '../../../../core/design/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../../../core/widgets/info_card.dart';
import '../../domain/entities/route_stop.dart';
import '../providers/route_provider.dart';

class StopDetailPage extends ConsumerWidget {
  final String stopId;
  final RouteStop? stop;

  const StopDetailPage({
    super.key,
    required this.stopId,
    this.stop,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If stop is provided, use it; otherwise fetch from provider
    RouteStop? stopData = stop;

    if (stopData == null) {
      final routeAsync = ref.watch(routeProvider);
      stopData = routeAsync.maybeWhen(
        data: (stops) => stops.firstWhere(
          (s) => s.id == stopId,
          orElse: () => throw Exception('Stop not found'),
        ),
        orElse: () => null,
      );
    }

    if (stopData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Durak Detayı')),
        body: const Center(child: Text('Durak bulunamadı')),
      );
    }

    // Now stopData is guaranteed to be non-null
    final finalStop = stopData;

    return Scaffold(
      appBar: AppBar(
        title: Text(finalStop.isPickup ? 'Alış Durağı' : 'Teslimat Durağı'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            InfoCard(
              leading: CircleAvatar(
                backgroundColor: finalStop.isPickup ? Colors.blue : Colors.green,
                child: Icon(
                  finalStop.isPickup ? Icons.upload : Icons.download,
                  color: Colors.white,
                ),
              ),
              title: finalStop.loadNumber,
              subtitle: finalStop.address,
              trailing: StatusChip(label: _getStatusLabel(finalStop.status)),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Stop Type
            _InfoRow(
              icon: finalStop.isPickup ? Icons.upload : Icons.download,
              label: 'Durak Tipi',
              value: finalStop.isPickup ? 'Alış' : 'Teslimat',
            ),
            const SizedBox(height: AppSpacing.md),

            // Address
            _InfoRow(
              icon: Icons.location_on,
              label: 'Adres',
              value: finalStop.address,
            ),
            const SizedBox(height: AppSpacing.md),

            // Expected Arrival
            if (finalStop.expectedArrival != null)
              _InfoRow(
                icon: Icons.schedule,
                label: 'Beklenen Varış',
                value: _formatDateTime(finalStop.expectedArrival!),
              ),
            const SizedBox(height: AppSpacing.lg),

            // Actions
            if (finalStop.status == 'pending' || finalStop.status == 'in_progress') ...[
              PrimaryButton(
                label: finalStop.status == 'pending' ? 'Vardım' : 'Ayrıldım',
                onPressed: () => _handleArriveDepart(context, ref, finalStop),
                icon: Icons.check_circle,
              ),
              const SizedBox(height: AppSpacing.md),
            ],

            if (finalStop.status == 'in_progress') ...[
              SecondaryButton(
                label: 'POD Oluştur',
                onPressed: () => _navigateToPOD(context, finalStop),
                icon: Icons.description,
              ),
              const SizedBox(height: AppSpacing.md),
            ],

            // Map Preview with Address - Clickable to open Google Maps
            InkWell(
              onTap: () => _openInGoogleMaps(finalStop),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Stack(
                  children: [
                    // Google Maps preview
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(finalStop.latitude, finalStop.longitude),
                          zoom: 15,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId(finalStop.id),
                            position: LatLng(finalStop.latitude, finalStop.longitude),
                            infoWindow: InfoWindow(title: finalStop.address),
                          ),
                        },
                        myLocationEnabled: false,
                        mapToolbarEnabled: false,
                        zoomControlsEnabled: false,
                        scrollGesturesEnabled: false,
                        zoomGesturesEnabled: false,
                        rotateGesturesEnabled: false,
                        tiltGesturesEnabled: false,
                      ),
                    ),
                    // Address overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withAlpha((255 * 0.8).round()),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white, size: 20),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text(
                                finalStop.address,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.open_in_new, color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'pending':
        return 'Beklemede';
      case 'in_progress':
        return 'Devam Ediyor';
      case 'completed':
        return 'Tamamlandı';
      default:
        return status;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _handleArriveDepart(BuildContext context, WidgetRef ref, RouteStop stop) async {
    if (stop.status == 'pending') {
      // Arrive
      await ref.read(routeProvider.notifier).arriveAtStop(stop.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vardım işlemi kaydedildi')),
        );
        context.pop();
      }
    } else if (stop.status == 'in_progress') {
      // Depart
      await ref.read(routeProvider.notifier).departFromStop(stop.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ayrıldım işlemi kaydedildi')),
        );
        context.pop();
      }
    }
  }

  void _navigateToPOD(BuildContext context, RouteStop stop) {
    context.push('/pod/${stop.id}?loadId=${stop.loadId}').then((success) {
      if (success == true && context.mounted) {
        // POD created successfully, refresh route
        context.pop();
      }
    });
  }

  Future<void> _openInGoogleMaps(RouteStop stop) async {
    // Try Google Maps app first, then fallback to browser
    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${stop.latitude},${stop.longitude}',
    );
    
    try {
      final launched = await launchUrl(
        googleMapsUrl, 
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        // Fallback to browser
        await launchUrl(googleMapsUrl, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint('Could not open maps: $e');
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

