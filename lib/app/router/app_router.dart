import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/secure_storage_service.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/dispatcher_dashboard/presentation/pages/dispatcher_dashboard_page.dart';
import '../../features/driver_route/presentation/pages/driver_route_page.dart';
import '../../features/driver_route/presentation/pages/stop_detail_page.dart';
import '../../features/pod/presentation/pages/pod_capture_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/loads/presentation/pages/load_detail_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) async {
      final token = await SecureStorageService().getToken();
      final role = await SecureStorageService().getUserRole();

      // If logged in, redirect to appropriate dashboard
      if (token != null && state.uri.path == '/login') {
        return role == 'dispatcher' ? '/dispatcher/dashboard' : '/driver/route';
      }

      // If not logged in and trying to access protected route
      if (token == null && state.uri.path != '/login') {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      // Dispatcher routes
      GoRoute(
        path: '/dispatcher',
        redirect: (context, state) => '/dispatcher/dashboard',
      ),
      GoRoute(
        path: '/dispatcher/dashboard',
        name: 'dispatcher-dashboard',
        builder: (context, state) => const DispatcherDashboardPage(),
      ),
      // Driver routes
      GoRoute(
        path: '/driver',
        redirect: (context, state) => '/driver/route',
      ),
      GoRoute(
        path: '/driver/route',
        name: 'driver-route',
        builder: (context, state) => const DriverRoutePage(),
      ),
      // Deep link routes
      GoRoute(
        path: '/load/:id',
        name: 'load-detail',
        builder: (context, state) {
          final loadId = state.pathParameters['id']!;
          return LoadDetailPage(loadId: loadId);
        },
      ),
      GoRoute(
        path: '/stop/:id',
        name: 'stop-detail',
        builder: (context, state) {
          final stopId = state.pathParameters['id']!;
          return StopDetailPage(stopId: stopId);
        },
      ),
      GoRoute(
        path: '/pod/:stopId',
        name: 'pod-capture',
        builder: (context, state) {
          final stopId = state.pathParameters['stopId']!;
          final loadId = state.uri.queryParameters['loadId'];
          return PodCapturePage(stopId: stopId, loadId: loadId);
        },
      ),
      GoRoute(
        path: '/incident/:id',
        name: 'incident-detail',
        builder: (context, state) {
          final incidentId = state.pathParameters['id']!;
          return Scaffold(
            appBar: AppBar(title: Text('Incident $incidentId')),
            body: Center(child: Text('Incident Detail: $incidentId')),
          );
        },
      ),
      // Settings route (accessible by both roles)
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
});

