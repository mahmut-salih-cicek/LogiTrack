import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/design/colors.dart';
import '../providers/dashboard_provider.dart';

class DispatcherMapWidget extends ConsumerStatefulWidget {
  const DispatcherMapWidget({super.key});

  @override
  ConsumerState<DispatcherMapWidget> createState() => _DispatcherMapWidgetState();
}

class _DispatcherMapWidgetState extends ConsumerState<DispatcherMapWidget> {
  GoogleMapController? _mapController;
  BitmapDescriptor? _truckIconInProgress;
  BitmapDescriptor? _truckIconPending;
  BitmapDescriptor? _truckIconCompleted;
  Timer? _movementTimer;
  String? _selectedDriverId; // Seçili kamyon ID'si
  
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(39.9334, 32.8597), // Turkey center
    zoom: 6,
  );

  // Driver positions with animation targets and route info
  final Map<String, Map<String, dynamic>> _driverPositions = {
    'driver_001': {
      'name': 'Mehmet Demir',
      'plate': '34 ABC 123',
      'startPosition': const LatLng(41.0082, 28.9784), // İstanbul (başlangıç)
      'currentPosition': const LatLng(40.22, 29.10), // Near Bursa, moving
      'targetPosition': const LatLng(40.1826, 29.0665), // Bursa OSB
      'status': 'in_progress',
      'currentStop': 'Bursa OSB',
      'route': [
        const LatLng(41.0082, 28.9784), // İstanbul
        const LatLng(40.1826, 29.0665), // Bursa
        const LatLng(38.4237, 27.1428), // İzmir
        const LatLng(36.8969, 30.7133), // Antalya
      ],
    },
    'driver_002': {
      'name': 'Ahmet Yılmaz',
      'plate': '06 XYZ 456',
      'startPosition': const LatLng(39.9334, 32.8597), // Ankara (başlangıç)
      'currentPosition': const LatLng(39.95, 32.85), // Near Ankara, moving
      'targetPosition': const LatLng(38.4237, 27.1428), // İzmir
      'status': 'pending',
      'currentStop': 'Yola çıkıyor',
      'route': [
        const LatLng(39.9334, 32.8597), // Ankara
        const LatLng(38.4237, 27.1428), // İzmir
      ],
    },
    'driver_003': {
      'name': 'Ali Kaya',
      'plate': '35 DEF 789',
      'startPosition': const LatLng(38.4237, 27.1428), // İzmir (başlangıç)
      'currentPosition': const LatLng(38.45, 27.15), // Near İzmir, moving
      'targetPosition': const LatLng(40.1826, 29.0665), // Bursa
      'status': 'completed',
      'currentStop': 'Teslimat tamamlandı',
      'route': [
        const LatLng(38.4237, 27.1428), // İzmir
        const LatLng(40.1826, 29.0665), // Bursa
      ],
    },
  };

  @override
  void initState() {
    super.initState();
    // Create truck icons for all statuses
    _createTruckIcon(const Color(0xFFFF9800), const Color(0xFFF57C00)).then((icon) {
      if (mounted) setState(() => _truckIconInProgress = icon);
    });
    _createTruckIcon(const Color(0xFFF44336), const Color(0xFFD32F2F)).then((icon) {
      if (mounted) setState(() => _truckIconPending = icon);
    });
    _createTruckIcon(const Color(0xFF4CAF50), const Color(0xFF388E3C)).then((icon) {
      if (mounted) setState(() => _truckIconCompleted = icon);
    });
    
    // Start truck movement simulation
    _startTruckMovements();
  }

  void _startTruckMovements() {
    // Minik hareketler - her 800ms'de bir küçük adım
    _movementTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        for (var driverId in _driverPositions.keys) {
          final driver = _driverPositions[driverId]!;
          final currentPos = driver['currentPosition'] as LatLng;
          final targetPos = driver['targetPosition'] as LatLng;
          
          // Calculate distance
          final latDiff = targetPos.latitude - currentPos.latitude;
          final lngDiff = targetPos.longitude - currentPos.longitude;
          final distance = latDiff.abs() + lngDiff.abs();
          
          // If close enough, stop or reset
          if (distance < 0.001) {
            // Reached target, reset to start position for continuous movement
            if (driver['status'] == 'in_progress') {
              driver['currentPosition'] = LatLng(
                currentPos.latitude + 0.01,
                currentPos.longitude + 0.01,
              );
            }
            continue;
          }
          
          // Minik adımlar (0.001 derece ≈ 100-150 metre)
          const stepSize = 0.001;
          
          double newLat = currentPos.latitude;
          double newLng = currentPos.longitude;
          
          if (latDiff.abs() > stepSize) {
            newLat += latDiff > 0 ? stepSize : -stepSize;
          } else {
            newLat = targetPos.latitude;
          }
          
          if (lngDiff.abs() > stepSize) {
            newLng += lngDiff > 0 ? stepSize : -stepSize;
          } else {
            newLng = targetPos.longitude;
          }
          
          driver['currentPosition'] = LatLng(newLat, newLng);
        }
      });
    });
  }

  @override
  void dispose() {
    _movementTimer?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  // Create professional truck marker with custom color
  Future<BitmapDescriptor> _createTruckIcon(Color color1, Color color2) async {
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

    // Gradient fill for pin (with custom colors)
    final pinGradient = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(70, 10),
        const Offset(70, 120),
        [
          color1, // Lighter shade
          color2, // Darker shade
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

    // Truck - modern flat design (use darker color)
    final truckPaint = Paint()
      ..color = color2
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

    // Window (lighter shade)
    final windowPaint = Paint()
      ..color = color1.withAlpha(180)
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
      ..color = color1.withAlpha(30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(const Offset(iconCenterX, iconCenterY + 5), 55, pulsePaint);

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  // Build stop/destination markers (location pins)
  Set<Marker> _buildStopMarkers() {
    final markers = <Marker>{};
    
    // Ana duraklar (her zaman göster)
    final mainStops = <String, LatLng>{
      'Bursa': const LatLng(40.1826, 29.0665),
      'İzmir': const LatLng(38.4237, 27.1428),
      'Antalya': const LatLng(36.8969, 30.7133),
      'Ankara': const LatLng(39.9334, 32.8597),
    };
    
    for (var entry in mainStops.entries) {
      markers.add(
        Marker(
          markerId: MarkerId('stop_${entry.key}'),
          position: entry.value,
          infoWindow: InfoWindow(
            title: '📍 ${entry.key}',
            snippet: 'Durak',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          zIndex: 10,
        ),
      );
    }
    
    // Eğer bir kamyon seçiliyse, o kamyonun rotasındaki özel durakları da göster
    if (_selectedDriverId != null) {
      // İstanbul marker'ı sadece Mehmet'in rotasında var (driver_001)
      if (_selectedDriverId == 'driver_001') {
        markers.add(
          Marker(
            markerId: const MarkerId('stop_Istanbul'),
            position: const LatLng(41.0082, 28.9784),
            infoWindow: const InfoWindow(
              title: '📍 İstanbul',
              snippet: 'Başlangıç Noktası',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            zIndex: 10,
          ),
        );
      }
    }
    
    return markers;
  }

  Set<Marker> _buildMarkers() {
    final markers = <Marker>{};
    
    // Add stop markers
    markers.addAll(_buildStopMarkers());
    
    // Add truck markers
    for (var entry in _driverPositions.entries) {
      final driverId = entry.key;
      final driver = entry.value;
      final position = driver['currentPosition'] as LatLng;
      final status = driver['status'] as String;
      
      // Select truck icon based on status
      BitmapDescriptor? icon;
      if (status == 'in_progress') {
        icon = _truckIconInProgress;
      } else if (status == 'pending') {
        icon = _truckIconPending;
      } else if (status == 'completed') {
        icon = _truckIconCompleted;
      }
      
      // If icon not loaded yet, use default marker
      if (icon == null) {
        final hue = status == 'completed'
            ? BitmapDescriptor.hueGreen
            : status == 'in_progress'
                ? BitmapDescriptor.hueOrange
                : BitmapDescriptor.hueRed;
        icon = BitmapDescriptor.defaultMarkerWithHue(hue);
      }
      
      markers.add(
        Marker(
          markerId: MarkerId(driverId),
          position: position,
          infoWindow: InfoWindow(
            title: '🚛 ${driver['name']}',
            snippet: '${driver['plate']}\n${driver['currentStop']}\nRotayı görmek için tıklayın',
          ),
          icon: icon,
          anchor: const Offset(0.5, 1.0), // Pin point at bottom
          zIndex: status == 'in_progress' ? 100 : 50,
          onTap: () {
            // Kamyona tıklayınca o kamyonun rotasını göster
            setState(() {
              if (_selectedDriverId == driverId) {
                // Zaten seçiliyse kapat
                _selectedDriverId = null;
              } else {
                // Yeni seçim
                _selectedDriverId = driverId;
              }
            });
          },
        ),
      );
    }
    
    return markers;
  }

  // Build polylines for selected driver's route only
  Set<Polyline> _buildPolylines() {
    final polylines = <Polyline>{};
    
    // Eğer hiçbir kamyon seçili değilse, polyline gösterme
    if (_selectedDriverId == null) {
      return polylines;
    }
    
    // Sadece seçili kamyonun rotasını göster
    final driver = _driverPositions[_selectedDriverId];
    if (driver == null) return polylines;
    
    final route = driver['route'] as List<LatLng>;
    final status = driver['status'] as String;
    final currentPosition = driver['currentPosition'] as LatLng;
    
    // Select color based on status
    Color lineColor;
    if (status == 'in_progress') {
      lineColor = const Color(0xFFFF9800); // Orange
    } else if (status == 'pending') {
      lineColor = const Color(0xFFF44336); // Red
    } else {
      lineColor = const Color(0xFF4CAF50); // Green
    }
    
    // Create route with current position
    final routeWithCurrent = <LatLng>[
      ...route.takeWhile((pos) => pos != driver['targetPosition']),
      currentPosition,
      driver['targetPosition'] as LatLng,
    ];
    
    polylines.add(
      Polyline(
        polylineId: PolylineId('route_$_selectedDriverId'),
        points: routeWithCurrent,
        color: lineColor,
        width: 5,
        patterns: [PatternItem.dash(30), PatternItem.gap(15)],
        geodesic: true,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
      ),
    );
    
    return polylines;
  }

  void _zoomIn() {
    _mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          onMapCreated: (controller) {
            _mapController = controller;
          },
          markers: _buildMarkers(),
          polylines: _buildPolylines(),
          onTap: (LatLng position) {
            // Haritaya tıklayınca rotaları kapat
            setState(() {
              _selectedDriverId = null;
            });
          },
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: true,
          mapToolbarEnabled: false,
        ),
        
        // Zoom and Refresh controls
        Positioned(
          right: 16,
          top: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Refresh button
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => ref.read(dashboardProvider.notifier).loadStats(),
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
              // Zoom Out
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
