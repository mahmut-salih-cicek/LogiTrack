import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/storage/secure_storage_service.dart';

class AuthGuard {
  final SecureStorageService _storage;

  AuthGuard(this._storage);

  Future<String?> canActivate(BuildContext context, GoRouterState state) async {
    final token = await _storage.getToken();
    final role = await _storage.getUserRole();

    if (token == null) {
      return '/login';
    }

    // Check role-based routing
    final path = state.uri.path;
    
    if (path.startsWith('/dispatcher') && role != 'dispatcher') {
      // Redirect to driver route if not dispatcher
      return role == 'driver' ? '/driver/route' : '/login';
    }

    if (path.startsWith('/driver') && role != 'driver') {
      // Redirect to dispatcher route if not driver
      return role == 'dispatcher' ? '/dispatcher/dashboard' : '/login';
    }

    return null; // Allow navigation
  }
}

