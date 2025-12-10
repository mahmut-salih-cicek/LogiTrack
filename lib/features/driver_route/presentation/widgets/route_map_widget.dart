import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design/colors.dart';
import '../providers/route_provider.dart';
import '../../domain/entities/route_stop.dart';

class RouteMapWidget extends ConsumerStatefulWidget {
  const RouteMapWidget({super.key});

  @override
  ConsumerState<RouteMapWidget> createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends ConsumerState<RouteMapWidget> {
  GoogleMapController? _mapController;
  BitmapDescriptor? _truckIcon;
  Timer? _movementTimer;
  bool _hasFittedBounds = false; // Flag to prevent auto-zoom on truck movement
  
  // Bursa stop coordinates (destination)
  static const LatLng _bursaStop = LatLng(40.1826, 29.0665);
  static const double _arrivalThreshold = 0.005; // ~500 meters
  
  // Start position (near Bursa, approaching)
  LatLng _currentTruckPosition = const LatLng(40.25, 29.10);
  bool _hasArrived = false;
  
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(39.9334, 32.8597), // Turkey center
    zoom: 6,
  );

  @override
  void initState() {
    super.initState();
    _createTruckIcon().then((icon) {
      if (mounted) {
        setState(() {
          _truckIcon = icon;
        });
      }
    });
    
    // Start truck movement simulation
    _startTruckMovement();
  }

  // Calculate distance between two coordinates (simple approximation)
  double _distanceToBursa(LatLng position) {
    final latDiff = (position.latitude - _bursaStop.latitude).abs();
    final lngDiff = (position.longitude - _bursaStop.longitude).abs();
    return latDiff + lngDiff; // Simple Manhattan distance approximation
  }

  void _startTruckMovement() {
    // Minik hareketler - her 800ms'de bir küçük adım
    _movementTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (!mounted || _hasArrived) {
        timer.cancel();
        return;
      }

      // Bursa'ya mesafe kontrolü
      final distance = _distanceToBursa(_currentTruckPosition);
      
      if (distance < _arrivalThreshold) {
        // Bursa'ya vardı, dur
        setState(() {
          _hasArrived = true;
          _currentTruckPosition = _bursaStop; // Exact position
        });
        timer.cancel();
        return;
      }

      // Minik adımlarla Bursa'ya doğru ilerle
      setState(() {
        final latDiff = _bursaStop.latitude - _currentTruckPosition.latitude;
        final lngDiff = _bursaStop.longitude - _currentTruckPosition.longitude;
        
        // Çok küçük adımlar (0.001 derece ≈ 100-150 metre)
        const stepSize = 0.001;
        
        double newLat = _currentTruckPosition.latitude;
        double newLng = _currentTruckPosition.longitude;
        
        if (latDiff.abs() > stepSize) {
          newLat += latDiff > 0 ? stepSize : -stepSize;
        } else {
          newLat = _bursaStop.latitude;
        }
        
        if (lngDiff.abs() > stepSize) {
          newLng += lngDiff > 0 ? stepSize : -stepSize;
        } else {
          newLng = _bursaStop.longitude;
        }
        
        _currentTruckPosition = LatLng(newLat, newLng);
      });
    });
  }

  @override
  void dispose() {
    _movementTimer?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  // Create professional truck marker with pulse effect
  Future<BitmapDescriptor> _createTruckIcon() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(140, 160);

    // === LOCATION PIN SHAPE ===
    final pinPath = Path();
    const pinCenterX = 70.0;
    const pinTopY = 10.0;
    const pinRadius = 50.0;
    
    // Draw pin shape (teardrop)
    pinPath.addArc(
      Rect.fromCircle(center: Offset(pinCenterX, pinTopY + pinRadius), radius: pinRadius),
      3.14159, // PI - start from left
      3.14159, // PI - half circle
    );
    pinPath.lineTo(pinCenterX, 140); // Point at bottom
    pinPath.close();

    // Shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withAlpha(60)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.save();
    canvas.translate(3, 3);
    canvas.drawPath(pinPath, shadowPaint);
    canvas.restore();

    // Gradient fill for pin
    final pinGradient = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(70, 10),
        const Offset(70, 120),
        [
          const Color(0xFF1E88E5), // Blue 600
          const Color(0xFF1565C0), // Blue 800
        ],
      );
    canvas.drawPath(pinPath, pinGradient);

    // White border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawPath(pinPath, borderPaint);

    // === TRUCK ICON INSIDE ===
    const iconCenterX = 70.0;
    const iconCenterY = 55.0;

    // White circle background for truck
    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(iconCenterX, iconCenterY), 32, circlePaint);

    // Truck - modern flat design
    final truckPaint = Paint()
      ..color = const Color(0xFF1565C0)
      ..style = PaintingStyle.fill;

    // Cargo (back of truck)
    final cargoPath = Path();
    cargoPath.addRRect(RRect.fromRectAndRadius(
      const Rect.fromLTWH(45, 42, 28, 22),
      const Radius.circular(3),
    ));
    canvas.drawPath(cargoPath, truckPaint);

    // Cabin (front)
    final cabinPath = Path();
    cabinPath.addRRect(RRect.fromRectAndRadius(
      const Rect.fromLTWH(73, 48, 14, 16),
      const Radius.circular(2),
    ));
    canvas.drawPath(cabinPath, truckPaint);

    // Window (light blue)
    final windowPaint = Paint()
      ..color = const Color(0xFF90CAF9)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(75, 50, 10, 8),
        const Radius.circular(1),
      ),
      windowPaint,
    );

    // Wheels
    final wheelPaint = Paint()
      ..color = const Color(0xFF424242)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(55, 68), 5, wheelPaint);
    canvas.drawCircle(const Offset(68, 68), 5, wheelPaint);
    canvas.drawCircle(const Offset(82, 68), 5, wheelPaint);

    // Wheel shine
    final shinePaint = Paint()
      ..color = Colors.white.withAlpha(150)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(54, 67), 2, shinePaint);
    canvas.drawCircle(const Offset(67, 67), 2, shinePaint);
    canvas.drawCircle(const Offset(81, 67), 2, shinePaint);

    // Ground line
    final groundPaint = Paint()
      ..color = const Color(0xFF424242).withAlpha(100)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(42, 73), const Offset(90, 73), groundPaint);

    // === PULSE RING (outer glow effect) ===
    final pulsePaint = Paint()
      ..color = const Color(0xFF1E88E5).withAlpha(30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(const Offset(iconCenterX, iconCenterY + 5), 55, pulsePaint);

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  Set<Marker> _buildMarkers(List<RouteStop> stops) {
    final markers = <Marker>{};
    
    // Add driver's current location marker (professional truck pin) - ANIMATED
    markers.add(
      Marker(
        markerId: const MarkerId('driver_location'),
        position: _currentTruckPosition,
        infoWindow: InfoWindow(
          title: '🚛 Mehmet Demir',
          snippet: _hasArrived 
            ? 'Bursa\'da • Teslim devam ediyor • 34 ABC 123'
            : 'Hareket halinde • Bursa\'ya yaklaşıyor • 34 ABC 123',
        ),
        icon: _truckIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        anchor: const Offset(0.5, 1.0), // Bottom center (pin point)
        zIndex: 100, // Always on top
        flat: false,
      ),
    );
    
    // Sort stops by expected arrival time for proper route order
    final sortedStops = List<RouteStop>.from(stops)
      ..sort((a, b) {
        if (a.expectedArrival == null) return 1;
        if (b.expectedArrival == null) return -1;
        return a.expectedArrival!.compareTo(b.expectedArrival!);
      });

    for (var i = 0; i < sortedStops.length; i++) {
      final stop = sortedStops[i];
      final position = LatLng(stop.latitude, stop.longitude);
      
      // Determine marker color based on status
      final hue = _getMarkerHue(stop.status);
      
      // Build detailed info window
      final stopType = stop.isPickup ? 'ALIŞ' : 'TESLİMAT';
      final statusEmoji = stop.status == 'completed' 
          ? '✅' 
          : stop.status == 'in_progress' 
              ? '🚛' 
              : '⏳';
      final title = '${i + 1}. $stopType $statusEmoji';
      final snippet = '${stop.loadNumber}\n${_getStatusText(stop.status)}\n${_getShortAddress(stop.address)}';
      
      // Use truck icon for in_progress stops (current location)
      BitmapDescriptor icon;
      if (stop.status == 'in_progress') {
        // For in_progress stops, use a custom truck icon
        // We'll use a different marker hue to make it stand out
        icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
      } else {
        icon = BitmapDescriptor.defaultMarkerWithHue(hue);
      }
      
      markers.add(
        Marker(
          markerId: MarkerId(stop.id),
          position: position,
          infoWindow: InfoWindow(
            title: title,
            snippet: snippet,
          ),
          icon: icon,
          // Make current stop more prominent
          alpha: stop.status == 'in_progress' ? 1.0 : 0.9,
        ),
      );
    }

    return markers;
  }

  String _getShortAddress(String address) {
    // Get first part of address (city and district)
    final parts = address.split(',');
    if (parts.length >= 2) {
      return '${parts[0]}, ${parts[1]}';
    }
    return address.length > 40 ? '${address.substring(0, 40)}...' : address;
  }

  Set<Polyline> _buildPolylines(List<RouteStop> stops) {
    final polylines = <Polyline>{};
    
    if (stops.isEmpty) return polylines;

    // Sort stops by expected arrival time
    final sortedStops = List<RouteStop>.from(stops)
      ..sort((a, b) {
        if (a.expectedArrival == null) return 1;
        if (b.expectedArrival == null) return -1;
        return a.expectedArrival!.compareTo(b.expectedArrival!);
      });

    // Create polyline points connecting all stops in order
    final points = sortedStops
        .map((stop) => LatLng(stop.latitude, stop.longitude))
        .toList();

    // Only create polyline if we have at least 2 points
    if (points.length >= 2) {
      polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: points,
          color: Colors.blue, // Bright blue for visibility
          width: 6, // Thicker line
          patterns: [
            PatternItem.dash(30),
            PatternItem.gap(15),
          ],
          geodesic: true, // Follow earth's curvature
        ),
      );
    }

    return polylines;
  }

  double _getMarkerHue(String status) {
    switch (status) {
      case 'completed':
        return BitmapDescriptor.hueGreen; // Tamamlandı - Yeşil
      case 'in_progress':
        return BitmapDescriptor.hueOrange; // Devam ediyor - Turuncu
      case 'pending':
      default:
        return BitmapDescriptor.hueRed; // Beklemede - Kırmızı
    }
  }

  String _getStatusText(String status) {
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

  void _fitMapToBounds(List<RouteStop> stops) {
    // Only fit bounds once on initial load, not on every update
    if (stops.isEmpty || _mapController == null || _hasFittedBounds) return;

    // Calculate bounds to fit all markers
    double minLat = stops.first.latitude;
    double maxLat = stops.first.latitude;
    double minLng = stops.first.longitude;
    double maxLng = stops.first.longitude;

    for (final stop in stops) {
      if (stop.latitude < minLat) minLat = stop.latitude;
      if (stop.latitude > maxLat) maxLat = stop.latitude;
      if (stop.longitude < minLng) minLng = stop.longitude;
      if (stop.longitude > maxLng) maxLng = stop.longitude;
    }

    final bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 80), // 80 padding
    );
    
    _hasFittedBounds = true; // Mark as fitted
  }

  void _zoomIn() {
    _mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    final routeAsync = ref.watch(routeProvider);

    return Stack(
      children: [
        routeAsync.when(
          data: (stops) {
            // Fit map to show all stops after map is ready
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _fitMapToBounds(stops);
            });

            return GoogleMap(
              initialCameraPosition: _initialPosition,
              onMapCreated: (controller) {
                _mapController = controller;
                _fitMapToBounds(stops);
              },
              markers: _buildMarkers(stops),
              polylines: _buildPolylines(stops),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              mapToolbarEnabled: false,
            );
          },
          loading: () => GoogleMap(
            initialCameraPosition: _initialPosition,
            myLocationEnabled: true,
          ),
          error: (error, stack) => GoogleMap(
            initialCameraPosition: _initialPosition,
            myLocationEnabled: true,
          ),
        ),
        // Map controls: Settings, Refresh, Zoom In/Out
        Positioned(
          right: 16,
          top: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Settings button (top)
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {
                    final context = ref.context;
                    context.push('/settings');
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Refresh button
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => ref.read(routeProvider.notifier).loadRoute(),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.refresh,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Zoom In
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: _zoomIn,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Zoom Out (bottom)
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: _zoomOut,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

