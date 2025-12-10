import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/storage/database/app_database.dart';
import 'core/storage/database/seed_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database and seed data
  final database = AppDatabase();
  await SeedData.seedDatabase(database);
  
  debugPrint('✅ Database seeded successfully!');

  // Run app
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
