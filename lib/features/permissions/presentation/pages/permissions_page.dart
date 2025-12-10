import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/design/text_styles.dart';
import '../../../../core/services/permissions_service.dart';
import '../../../../core/widgets/primary_button.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  bool _locationGranted = false;
  bool _cameraGranted = false;
  bool _storageGranted = false;
  bool _microphoneGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final location = await PermissionsService.checkLocationPermission();
    final camera = await PermissionsService.checkCameraPermission();
    final storage = await PermissionsService.checkStoragePermission();
    final microphone = await PermissionsService.checkMicrophonePermission();

    setState(() {
      _locationGranted = location;
      _cameraGranted = camera;
      _storageGranted = storage;
      _microphoneGranted = microphone;
    });
  }

  Future<void> _requestPermission(Permission permission, String name) async {
    final status = await permission.request();
    if (!mounted) return;
    
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$name izni verildi')),
      );
    } else if (status.isPermanentlyDenied) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name izni kalıcı olarak reddedildi. Lütfen ayarlardan açın.'),
          action: SnackBarAction(
            label: 'Ayarlar',
            onPressed: () => PermissionsService.openAppSettings(),
          ),
        ),
      );
    }
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İzinler'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _PermissionItem(
            icon: Icons.location_on,
            title: 'Konum',
            description: 'Rota takibi ve teslimat işlemleri için gerekli',
            isGranted: _locationGranted,
            onRequest: () => _requestPermission(Permission.location, 'Konum'),
          ),
          const SizedBox(height: AppSpacing.md),
          _PermissionItem(
            icon: Icons.camera_alt,
            title: 'Kamera',
            description: 'Teslimat kanıtı için fotoğraf çekmek için gerekli',
            isGranted: _cameraGranted,
            onRequest: () => _requestPermission(Permission.camera, 'Kamera'),
          ),
          const SizedBox(height: AppSpacing.md),
          _PermissionItem(
            icon: Icons.folder,
            title: 'Depolama',
            description: 'Belgeleri kaydetmek için gerekli',
            isGranted: _storageGranted,
            onRequest: () => _requestPermission(Permission.storage, 'Depolama'),
          ),
          const SizedBox(height: AppSpacing.md),
          _PermissionItem(
            icon: Icons.mic,
            title: 'Mikrofon',
            description: 'Ses notları kaydetmek için gerekli',
            isGranted: _microphoneGranted,
            onRequest: () => _requestPermission(Permission.microphone, 'Mikrofon'),
          ),
        ],
      ),
    );
  }
}

class _PermissionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isGranted;
  final VoidCallback onRequest;

  const _PermissionItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.isGranted,
    required this.onRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: isGranted ? Colors.green : Colors.grey),
        title: Text(title, style: AppTextStyles.titleMedium),
        subtitle: Text(description, style: AppTextStyles.bodySmall),
        trailing: isGranted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : PrimaryButton(
                label: 'İzin Ver',
                onPressed: onRequest,
                width: 100,
              ),
      ),
    );
  }
}

