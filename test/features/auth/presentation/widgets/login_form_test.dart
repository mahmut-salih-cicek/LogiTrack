import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lojistik_application/features/auth/presentation/widgets/login_form.dart';

void main() {
  testWidgets('Login form renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: LoginForm(),
          ),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Şifre'), findsOneWidget);
    expect(find.text('Giriş Yap'), findsOneWidget);
  });
}

