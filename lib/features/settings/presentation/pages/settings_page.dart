import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design/colors.dart';
import '../../../../core/design/spacing.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Operasyon Ayarları',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
        shadowColor: Colors.black.withAlpha(10),
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // Profil Bölümü
          _buildSectionHeader('Profil'),
          _buildSettingTile(
            icon: Icons.person,
            title: 'Sürücü Bilgileri',
            subtitle: 'Mehmet Demir • 34 ABC 123',
            onTap: () {
              // TODO: Profil düzenleme sayfası
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profil düzenleme (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.phone,
            title: 'Telefon Numarası',
            subtitle: '+90 532 123 4567',
            onTap: () {
              // TODO: Telefon güncelleme
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Telefon güncelleme (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.local_shipping,
            title: 'Araç Plakası',
            subtitle: '34 ABC 123',
            onTap: () {
              // TODO: Plaka güncelleme
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Plaka güncelleme (Demo)')),
              );
            },
          ),

          const SizedBox(height: AppSpacing.lg),
          _buildDivider(),

          // Bildirimler
          _buildSectionHeader('Bildirimler'),
          _buildSwitchTile(
            icon: Icons.notifications,
            title: 'Push Bildirimleri',
            subtitle: 'Yeni iş atamaları ve güncellemeler',
            value: true,
            onChanged: (value) {
              // TODO: Bildirim ayarı kaydet
            },
          ),
          _buildSwitchTile(
            icon: Icons.vibration,
            title: 'Titreşim',
            subtitle: 'Bildirimlerde titreşim kullan',
            value: true,
            onChanged: (value) {
              // TODO: Titreşim ayarı kaydet
            },
          ),
          _buildSwitchTile(
            icon: Icons.volume_up,
            title: 'Sesli Bildirim',
            subtitle: 'Bildirimlerde ses çal',
            value: false,
            onChanged: (value) {
              // TODO: Ses ayarı kaydet
            },
          ),

          const SizedBox(height: AppSpacing.lg),
          _buildDivider(),

          // Konum & Takip
          _buildSectionHeader('Konum & Takip'),
          _buildSwitchTile(
            icon: Icons.location_on,
            title: 'Arka Plan Konum Takibi',
            subtitle: 'Uygulama kapalıyken konum gönder',
            value: true,
            onChanged: (value) {
              // TODO: Arka plan takip ayarı
            },
          ),
          _buildSettingTile(
            icon: Icons.timer,
            title: 'Konum Güncelleme Sıklığı',
            subtitle: 'Her 30 saniyede bir',
            onTap: () {
              // TODO: Güncelleme sıklığı ayarı
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Güncelleme sıklığı (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.speed,
            title: 'Hız Limiti Uyarısı',
            subtitle: '120 km/h üzeri uyar',
            onTap: () {
              // TODO: Hız limiti ayarı
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Hız limiti ayarı (Demo)')),
              );
            },
          ),

          const SizedBox(height: AppSpacing.lg),
          _buildDivider(),

          // Uygulama Ayarları
          _buildSectionHeader('Uygulama'),
          _buildSettingTile(
            icon: Icons.language,
            title: 'Dil',
            subtitle: 'Türkçe',
            onTap: () {
              // TODO: Dil seçimi
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dil seçimi (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.dark_mode,
            title: 'Tema',
            subtitle: 'Açık Tema',
            onTap: () {
              // TODO: Tema değiştirme
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tema değiştirme (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.storage,
            title: 'Önbellek Temizle',
            subtitle: 'Yerel verileri temizle',
            onTap: () {
              // TODO: Önbellek temizleme
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Önbellek temizlendi (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.data_usage,
            title: 'Veri Kullanımı',
            subtitle: 'Aylık veri tüketimi',
            onTap: () {
              // TODO: Veri kullanımı göster
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Veri kullanımı (Demo)')),
              );
            },
          ),

          const SizedBox(height: AppSpacing.lg),
          _buildDivider(),

          // Yardım & Destek
          _buildSectionHeader('Yardım & Destek'),
          _buildSettingTile(
            icon: Icons.help_outline,
            title: 'Yardım Merkezi',
            subtitle: 'SSS ve kullanım kılavuzu',
            onTap: () {
              // TODO: Yardım sayfası
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Yardım merkezi (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.headset_mic,
            title: 'Destek',
            subtitle: '7/24 müşteri desteği',
            onTap: () {
              // TODO: Destek sayfası
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Destek (Demo)')),
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.info_outline,
            title: 'Hakkında',
            subtitle: 'Versiyon 1.0.0',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Hakkında'),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TURUSA Lojistik Uygulaması'),
                      SizedBox(height: 8),
                      Text('Versiyon: 1.0.0'),
                      SizedBox(height: 8),
                      Text('© 2024 TURUSA. Tüm hakları saklıdır.'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Tamam'),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: AppSpacing.xl),
          _buildDivider(),
          const SizedBox(height: AppSpacing.lg),

          // Çıkış Yap
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Çıkış Yap'),
                    content: const Text('Çıkış yapmak istediğinize emin misiniz?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('İptal'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.error,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Çıkış Yap'),
                      ),
                    ],
                  ),
                );

                if (confirmed == true && context.mounted) {
                  await ref.read(authProvider.notifier).logout();
                  if (context.mounted) {
                    context.go('/login');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Çıkış Yap',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.xl,
        bottom: AppSpacing.md,
        left: AppSpacing.md,
        right: AppSpacing.md,
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF10B981),
                  Color(0xFF059669),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF10B981),
                const Color(0xFF059669),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF10B981).withAlpha(40),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Color(0xFF111827),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF10B981),
                const Color(0xFF059669),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF10B981).withAlpha(40),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Color(0xFF111827),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF10B981),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const SizedBox(height: AppSpacing.xs);
  }
}
