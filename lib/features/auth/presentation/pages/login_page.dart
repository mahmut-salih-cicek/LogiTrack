import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design/spacing.dart';
import '../widgets/login_form.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isAuthenticated && next.user != null) {
        // Navigate based on role
        final route = next.user!.isDispatcher
            ? '/dispatcher/dashboard'
            : '/driver/route';
        context.go(route);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo & Title
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF059669)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.local_shipping_rounded,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const Text(
                    'LogiTrack',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Akıllı Lojistik Yönetim Sistemi',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxxl),
                  
                  // Login Form
                  const LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
