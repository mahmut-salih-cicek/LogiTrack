import 'package:flutter/material.dart';
import '../../../../core/widgets/empty_state.dart';

class UploadQueuePage extends StatelessWidget {
  const UploadQueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yükleme Kuyruğu'),
      ),
      body: const EmptyState(
        icon: Icons.cloud_upload,
        title: 'Yükleme yok',
        message: 'Bekleyen yükleme bulunmamaktadır',
      ),
    );
  }
}

