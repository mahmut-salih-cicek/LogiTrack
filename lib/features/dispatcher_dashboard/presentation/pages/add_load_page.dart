import 'package:flutter/material.dart';
import '../../../../core/design/spacing.dart';

class AddLoadPage extends StatefulWidget {
  const AddLoadPage({super.key});

  @override
  State<AddLoadPage> createState() => _AddLoadPageState();
}

class _AddLoadPageState extends State<AddLoadPage> {
  final _formKey = GlobalKey<FormState>();
  final _loadNumberController = TextEditingController();
  final _pickupAddressController = TextEditingController();
  final _deliveryAddressController = TextEditingController();
  final _driverNameController = TextEditingController();
  final _vehiclePlateController = TextEditingController();
  final _tonajController = TextEditingController();
  final _desiController = TextEditingController();
  final _cargoTypeController = TextEditingController();
  final _packageCountController = TextEditingController();
  String _cargoCategory = 'Genel Kargo';
  bool _hasCMR = false;
  bool _hasInsurance = false;

  @override
  void dispose() {
    _loadNumberController.dispose();
    _pickupAddressController.dispose();
    _deliveryAddressController.dispose();
    _driverNameController.dispose();
    _vehiclePlateController.dispose();
    _tonajController.dispose();
    _desiController.dispose();
    _cargoTypeController.dispose();
    _packageCountController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('İş oluşturuldu: ${_loadNumberController.text}'),
          backgroundColor: const Color(0xFF10B981),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Yeni Taşıma İşi Oluştur',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // İş Bilgileri
            _buildSectionHeader('İş Bilgileri', Icons.business),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _loadNumberController,
              decoration: const InputDecoration(
                labelText: 'İş / Sefer Numarası',
                hintText: 'TRK-2024-XXX',
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Araç ve Sürücü
            _buildSectionHeader('Araç ve Sürücü Bilgileri', Icons.local_shipping),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _driverNameController,
              decoration: const InputDecoration(
                labelText: 'Sürücü Adı Soyadı',
                hintText: 'Mehmet Demir',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _vehiclePlateController,
              decoration: const InputDecoration(
                labelText: 'Araç Plakası',
                hintText: '34 ABC 123',
                prefixIcon: Icon(Icons.local_shipping),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Yük Bilgileri
            _buildSectionHeader('Yük Bilgileri', Icons.inventory),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<String>(
              value: _cargoCategory,
              decoration: const InputDecoration(
                labelText: 'Yük Kategorisi',
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              items: const [
                DropdownMenuItem(value: 'Genel Kargo', child: Text('Genel Kargo')),
                DropdownMenuItem(value: 'Paletli Yük', child: Text('Paletli Yük')),
                DropdownMenuItem(value: 'Tehlikeli Madde (ADR)', child: Text('Tehlikeli Madde (ADR)')),
                DropdownMenuItem(value: 'Soğuk Zincir', child: Text('Soğuk Zincir')),
                DropdownMenuItem(value: 'Değerli Eşya', child: Text('Değerli Eşya')),
                DropdownMenuItem(value: 'Proje Taşımacılığı', child: Text('Proje Taşımacılığı')),
              ],
              onChanged: (value) {
                setState(() {
                  _cargoCategory = value!;
                });
              },
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _cargoTypeController,
              decoration: const InputDecoration(
                labelText: 'Yük Cinsi',
                hintText: 'Elektronik Eşya, Tekstil, Gıda vb.',
                prefixIcon: Icon(Icons.inventory_2),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _packageCountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Koli Sayısı',
                      hintText: '45',
                      prefixIcon: Icon(Icons.inventory),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextFormField(
                    controller: _tonajController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Tonaj',
                      hintText: '12.5',
                      suffixText: 'ton',
                      prefixIcon: Icon(Icons.scale),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _desiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Desi (m³)',
                hintText: '24.5',
                suffixText: 'm³',
                prefixIcon: Icon(Icons.straighten),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Belgeler
            _buildSectionHeader('Gerekli Belgeler', Icons.description),
            const SizedBox(height: AppSpacing.sm),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('CMR Belgesi (Uluslararası)'),
                    subtitle: const Text('Karayolu taşımacılığı belgesi'),
                    value: _hasCMR,
                    onChanged: (value) {
                      setState(() {
                        _hasCMR = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const Divider(height: 1),
                  CheckboxListTile(
                    title: const Text('Nakliye Sigortası'),
                    subtitle: const Text('Yük hasarı ve kayıp sigortası'),
                    value: _hasInsurance,
                    onChanged: (value) {
                      setState(() {
                        _hasInsurance = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Güzergah
            _buildSectionHeader('Güzergah Bilgileri', Icons.route),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _pickupAddressController,
              decoration: const InputDecoration(
                labelText: 'Yükleme Adresi',
                hintText: 'İstanbul, Kadıköy...',
                prefixIcon: Icon(Icons.upload),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 2,
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _deliveryAddressController,
              decoration: const InputDecoration(
                labelText: 'Boşaltma / Teslimat Adresi',
                hintText: 'Ankara, Çankaya...',
                prefixIcon: Icon(Icons.download),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 2,
              validator: (value) => value?.isEmpty ?? true ? 'Gerekli' : null,
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Submit Button
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _handleSubmit,
                icon: const Icon(Icons.check_circle, size: 24),
                label: const Text(
                  'İş Oluştur',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF10B981), Color(0xFF059669)],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}

