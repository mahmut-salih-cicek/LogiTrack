import 'package:flutter/material.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/widgets/primary_button.dart';

class CreateIncidentPage extends StatelessWidget {
  const CreateIncidentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İstisna Oluştur'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const TextField(
            decoration: InputDecoration(labelText: 'Tip'),
          ),
          const SizedBox(height: AppSpacing.md),
          const TextField(
            decoration: InputDecoration(labelText: 'Açıklama'),
            maxLines: 5,
          ),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: 'Gönder',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

