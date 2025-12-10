import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:signature/signature.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/design/spacing.dart';
import '../../../../core/design/text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/pod_entity.dart';
import '../../domain/repositories/pod_repository.dart';
import '../../data/repositories/pod_repository_impl.dart';
import '../../../../app/di/dependency_injection.dart';

final podRepositoryProvider = Provider<PodRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return PodRepositoryImpl(database);
});

class PodCapturePage extends ConsumerStatefulWidget {
  final String stopId;
  final String? loadId;

  const PodCapturePage({
    super.key,
    required this.stopId,
    this.loadId,
  });

  @override
  ConsumerState<PodCapturePage> createState() => _PodCapturePageState();
}

class _PodCapturePageState extends ConsumerState<PodCapturePage> {
  final _formKey = GlobalKey<FormState>();
  final _receiverNameController = TextEditingController();
  final _notesController = TextEditingController();
  final _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final List<String> _photos = [];
  final List<String> _packageScans = [];
  bool _isLoading = false;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _receiverNameController.dispose();
    _notesController.dispose();
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      // Location error - continue without location
    }
  }

  Future<void> _takePhoto() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _photos.add(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fotoğraf çekilemedi: $e')),
        );
      }
    }
  }

  Future<void> _scanPackage() async {
    // Navigate to scanner page
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const _PackageScannerPage(),
      ),
    );

    if (result != null) {
      setState(() {
        _packageScans.add(result);
      });
    }
  }

  Future<void> _savePod() async {
    if (!_formKey.currentState!.validate()) return;

    if (_photos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('En az bir fotoğraf ekleyiniz')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final repository = ref.read(podRepositoryProvider);
      final uuid = const Uuid();

      // Export signature if drawn
      String? signaturePath;
      try {
        final signatureData = await _signatureController.toPngBytes();
        if (signatureData != null && signatureData.isNotEmpty) {
          // In production, save to file system
          signaturePath = 'signature_${uuid.v4()}.png';
        }
      } catch (e) {
        // No signature drawn
      }

      final pod = PodEntity(
        id: uuid.v4(),
        stopId: widget.stopId,
        loadId: widget.loadId ?? '',
        receiverName: _receiverNameController.text.trim().isEmpty
            ? null
            : _receiverNameController.text.trim(),
        signaturePath: signaturePath,
        photos: _photos,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        packageScans: _packageScans,
        latitude: _currentPosition?.latitude ?? 0.0,
        longitude: _currentPosition?.longitude ?? 0.0,
        createdAt: DateTime.now(),
      );

      final result = await repository.createPod(pod);

      if (mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('POD başarıyla oluşturuldu')),
          );
          Navigator.pop(context, true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hata: ${result.failureOrNull?.message ?? "Bilinmeyen hata"}'),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POD Oluştur'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // Receiver Name
            TextFormField(
              controller: _receiverNameController,
              decoration: const InputDecoration(
                labelText: 'Alıcı Adı',
                hintText: 'Alıcının adını giriniz',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Photos Section
            Text('Fotoğraflar (${_photos.length})', style: AppTextStyles.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            SecondaryButton(
              label: 'Fotoğraf Çek',
              onPressed: _takePhoto,
              icon: Icons.camera_alt,
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_photos.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _photos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: Stack(
                        children: [
                          Image.file(
                            File(_photos[index]),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _photos.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: AppSpacing.lg),

            // Signature Section
            Text('İmza', style: AppTextStyles.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SecondaryButton(
              label: 'İmzayı Temizle',
              onPressed: () => _signatureController.clear(),
              icon: Icons.clear,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Package Scans
            Text('Paket Taramaları (${_packageScans.length})', style: AppTextStyles.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            SecondaryButton(
              label: 'Paket Tara',
              onPressed: _scanPackage,
              icon: Icons.qr_code_scanner,
            ),
            if (_packageScans.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              ..._packageScans.map((scan) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: Chip(
                      label: Text(scan),
                      onDeleted: () {
                        setState(() {
                          _packageScans.remove(scan);
                        });
                      },
                    ),
                  )),
            ],
            const SizedBox(height: AppSpacing.lg),

            // Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notlar',
                hintText: 'Ek notlarınızı giriniz',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Submit Button
            PrimaryButton(
              label: _isLoading ? 'Kaydediliyor...' : 'POD Kaydet',
              onPressed: _isLoading ? null : _savePod,
              icon: Icons.save,
            ),
          ],
        ),
      ),
    );
  }
}

class _PackageScannerPage extends StatefulWidget {
  const _PackageScannerPage();

  @override
  State<_PackageScannerPage> createState() => _PackageScannerPageState();
}

class _PackageScannerPageState extends State<_PackageScannerPage> {
  final MobileScannerController _controller = MobileScannerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Tara'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  Navigator.pop(context, barcode.rawValue);
                  return;
                }
              }
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('İptal'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
