import 'package:dio/dio.dart';

/// Mock datasource that simulates API responses
/// In production, this would be replaced with actual API calls
class MockDataSource {
  static const String baseUrl = 'https://api.turusa.com';

  /// Simulate network delay
  static Future<void> _delay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// Mock login response
  static Future<Map<String, dynamic>> login(String email, String password) async {
    await _delay();
    
    // Mock validation
    if (email.isEmpty || password.isEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: '/auth/login'),
        response: Response(
          requestOptions: RequestOptions(path: '/auth/login'),
          statusCode: 400,
          data: {'error': 'Email ve şifre gereklidir'},
        ),
      );
    }

    // Mock users
    final isDispatcher = email.contains('dispatcher') || email == 'dispatcher@turusa.com';
    final isDriver = email.contains('driver') || email == 'driver@turusa.com';

    if (!isDispatcher && !isDriver) {
      throw DioException(
        requestOptions: RequestOptions(path: '/auth/login'),
        response: Response(
          requestOptions: RequestOptions(path: '/auth/login'),
          statusCode: 401,
          data: {'error': 'Geçersiz email veya şifre'},
        ),
      );
    }

    return {
      'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      'refreshToken': 'mock_refresh_token',
      'user': {
        'id': isDispatcher ? 'disp_001' : 'driver_001',
        'email': email,
        'name': isDispatcher ? 'Ahmet Yılmaz' : 'Mehmet Demir',
        'role': isDispatcher ? 'dispatcher' : 'driver',
        'phone': '+90 555 123 4567',
      },
    };
  }

  /// Mock loads list - Updated to match seed data: Istanbul → Bursa → Izmir → Antalya
  static Future<List<Map<String, dynamic>>> getLoads({String? date, String? status}) async {
    await _delay();

    final now = DateTime.now();
    final sixHoursAgo = now.subtract(const Duration(hours: 6));
    final twoHoursAgo = now.subtract(const Duration(hours: 2));
    final threeHoursLater = now.add(const Duration(hours: 3));
    final eightHoursLater = now.add(const Duration(hours: 8));

    final loads = [
      {
        'id': 'load_001',
        'loadNumber': 'TRK-2024-001',
        'status': 'in_transit',
        'assignedDriverId': 'driver_001',
        'assignedDriverName': 'Mehmet Demir (34 ABC 123)',
        'pickupAddress': 'İstanbul, Kadıköy, Anadolu Yakası Lojistik Merkezi',
        'deliveryAddress': 'Antalya, Muratpaşa, OSB Merkez Dağıtım',
        'pickupDate': sixHoursAgo.toIso8601String(),
        'deliveryDate': eightHoursLater.toIso8601String(),
        'stops': [
          {
            'id': 'stop_001',
            'type': 'pickup',
            'address': 'İstanbul, Kadıköy, Anadolu Yakası Lojistik Merkezi, E-5 Yan Yol No:47',
            'latitude': 40.9848,
            'longitude': 29.0262,
            'geofenceRadius': 150.0,
            'status': 'completed', // ✅ TAMAMLANDI
            'expectedArrival': sixHoursAgo.toIso8601String(),
            'actualArrival': sixHoursAgo.subtract(const Duration(minutes: 15)).toIso8601String(),
            'actualDeparture': sixHoursAgo.add(const Duration(minutes: 30)).toIso8601String(),
            'notes': '45 paket yüklendi. Manifest onaylandı. Çıkış: 06:30',
          },
          {
            'id': 'stop_002',
            'type': 'delivery',
            'address': 'Bursa, Nilüfer, Organize Sanayi Bölgesi, 4. Cadde No:18',
            'latitude': 40.1826,
            'longitude': 29.0665,
            'geofenceRadius': 150.0,
            'status': 'in_progress', // 🟠 DEVAM EDİYOR
            'expectedArrival': twoHoursAgo.toIso8601String(),
            'actualArrival': twoHoursAgo.add(const Duration(minutes: 10)).toIso8601String(),
            'notes': 'Teslim alınıyor. 15 paket indiriliyor. Tahmini süre: 30dk',
          },
          {
            'id': 'stop_003',
            'type': 'delivery',
            'address': 'İzmir, Konak, Alsancak Liman Bölgesi, Atatürk Caddesi No:156',
            'latitude': 38.4237,
            'longitude': 27.1428,
            'geofenceRadius': 150.0,
            'status': 'pending', // 🔴 BEKLİYOR
            'expectedArrival': threeHoursLater.toIso8601String(),
            'notes': 'Liman teslimatı. Gümrük belgesi gerekli. ETA: 3 saat',
          },
          {
            'id': 'stop_004',
            'type': 'delivery',
            'address': 'Antalya, Muratpaşa, OSB, Barınaklar Bulvarı No:89',
            'latitude': 36.8969,
            'longitude': 30.7133,
            'geofenceRadius': 150.0,
            'status': 'pending', // 🔴 BEKLİYOR
            'expectedArrival': eightHoursLater.toIso8601String(),
            'notes': 'Son teslimat. 10 paket. Boş dönüş planlanacak. ETA: 8 saat',
          },
        ],
        'createdAt': now.subtract(const Duration(days: 1)).toIso8601String(),
      },
      // Load 2: Ankara → İzmir (Assigned, not started)
      {
        'id': 'load_002',
        'loadNumber': 'TRK-2024-002',
        'status': 'assigned',
        'assignedDriverId': 'driver_002',
        'assignedDriverName': 'Ahmet Yılmaz (06 XYZ 456)',
        'pickupAddress': 'Ankara, Keçiören, Ana Depo',
        'deliveryAddress': 'İzmir, Bornova, Liman Deposu',
        'pickupDate': now.add(const Duration(hours: 2)).toIso8601String(),
        'deliveryDate': now.add(const Duration(hours: 10)).toIso8601String(),
        'stops': [],
        'createdAt': now.toIso8601String(),
      },
      // Load 3: İzmir → Bursa (Completed)
      {
        'id': 'load_003',
        'loadNumber': 'TRK-2024-003',
        'status': 'completed',
        'assignedDriverId': 'driver_003',
        'assignedDriverName': 'Ali Kaya (35 DEF 789)',
        'pickupAddress': 'İzmir, Konak, Liman Bölgesi',
        'deliveryAddress': 'Bursa, Osmangazi, Sanayi Sitesi',
        'pickupDate': now.subtract(const Duration(hours: 8)).toIso8601String(),
        'deliveryDate': now.subtract(const Duration(hours: 2)).toIso8601String(),
        'stops': [],
        'createdAt': now.subtract(const Duration(hours: 12)).toIso8601String(),
      },
    ];

    if (status != null) {
      return loads.where((load) => load['status'] == status).toList();
    }

    return loads;
  }

  /// Mock load detail
  static Future<Map<String, dynamic>> getLoadDetail(String loadId) async {
    await _delay();

    final loads = await getLoads();
    final load = loads.firstWhere(
      (l) => l['id'] == loadId,
      orElse: () => throw DioException(
        requestOptions: RequestOptions(path: '/loads/$loadId'),
        response: Response(
          requestOptions: RequestOptions(path: '/loads/$loadId'),
          statusCode: 404,
          data: {'error': 'Load not found'},
        ),
      ),
    );

    return load;
  }

  /// Mock assign load to driver
  static Future<Map<String, dynamic>> assignLoadToDriver(String loadId, String driverId) async {
    await _delay();

    return {
      'success': true,
      'message': 'Load assigned successfully',
      'load': {
        'id': loadId,
        'assignedDriverId': driverId,
        'status': 'assigned',
      },
    };
  }

  /// Mock dashboard stats
  static Future<Map<String, dynamic>> getDashboardStats() async {
    await _delay();

    return {
      'activeLoads': 12,
      'onTimePercentage': 87.5,
      'exceptionsCount': 3,
      'onlineDrivers': 8,
    };
  }

  /// Mock live drivers
  static Future<List<Map<String, dynamic>>> getLiveDrivers() async {
    await _delay();

    return [
      {
        'id': 'driver_001',
        'name': 'Mehmet Demir',
        'latitude': 40.1826,
        'longitude': 29.0665,
        'isOnline': true,
        'currentLoadId': 'load_002',
      },
      {
        'id': 'driver_002',
        'name': 'Ali Yıldız',
        'latitude': 38.4237,
        'longitude': 27.1428,
        'isOnline': true,
        'currentLoadId': null,
      },
    ];
  }

  /// Mock submit POD
  static Future<Map<String, dynamic>> submitPOD(Map<String, dynamic> podData) async {
    await _delay();

    return {
      'success': true,
      'podId': 'pod_${DateTime.now().millisecondsSinceEpoch}',
      'message': 'POD submitted successfully',
    };
  }

  /// Mock raise incident
  static Future<Map<String, dynamic>> raiseIncident(Map<String, dynamic> incidentData) async {
    await _delay();

    return {
      'success': true,
      'incidentId': 'inc_${DateTime.now().millisecondsSinceEpoch}',
      'message': 'Incident reported successfully',
    };
  }

  /// Mock upload document
  static Future<Map<String, dynamic>> uploadDocument(FormData formData) async {
    await _delay();

    return {
      'success': true,
      'fileId': 'file_${DateTime.now().millisecondsSinceEpoch}',
      'url': 'https://storage.turusa.com/files/file_${DateTime.now().millisecondsSinceEpoch}',
    };
  }

  /// Mock location ping
  static Future<Map<String, dynamic>> sendLocationPing(Map<String, dynamic> locationData) async {
    await _delay();

    return {
      'success': true,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Mock register FCM token
  static Future<Map<String, dynamic>> registerFcmToken(String token) async {
    await _delay();

    return {
      'success': true,
      'message': 'FCM token registered',
    };
  }
}

