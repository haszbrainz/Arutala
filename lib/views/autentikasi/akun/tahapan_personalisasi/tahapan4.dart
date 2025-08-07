import 'package:flutter/material.dart';
// Ganti 'mindoro' dengan nama proyek Anda jika berbeda
import 'package:program_arutala/themes/custom_colors.dart'; 
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart';

class Tahapan4 extends StatelessWidget {
  final PageController pageController;
  const Tahapan4({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          // Header
          Row(
            children: [
              const Icon(Icons.card_giftcard, size: 32, color: CustomColors.neutral500),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Ini pencapaian yang dapat kamu raih!',
                  style: CustomTextStyles.mediumXl,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Kartu Bonus
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: CustomColors.neutral200),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.neutral200.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              children: [
                _buildBonusItem(
                  icon: Icons.checklist_rtl,
                  title: 'Belajar dengan Percaya Diri',
                  subtitle: '50.000+ latihan interaktif yang tentunya seru',
                ),
                const Divider(height: 32),
                _buildBonusItem(
                  icon: Icons.search,
                  title: 'Menguasai Beragam Topik',
                  subtitle: '5.000+ materi pembelajaran dari berbagai subjek',
                ),
                const Divider(height: 32),
                _buildBonusItem(
                  icon: Icons.extension,
                  title: 'Mengembangkan Belajar',
                  subtitle: 'Pengingat cerdas, tantangan seru, dan lainnya',
                ),
              ],
            ),
          ),

          const Spacer(), // Mendorong tombol ke bawah

          // Tombol Selanjutnya
          ElevatedButton(
            onPressed: () {
              // Pindah ke halaman welcome registrasi dan hapus semua halaman sebelumnya
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.welcomeRegistrasi, // Arahkan ke rute welcome registrasi
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.primary500,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            child: Text('Selanjutnya', style: CustomTextStyles.semiboldBase.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Helper widget untuk setiap item bonus
  Widget _buildBonusItem({required IconData icon, required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: CustomColors.primary500, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: CustomTextStyles.semiboldBase),
              const SizedBox(height: 4),
              Text(subtitle, style: CustomTextStyles.regularSm.copyWith(color: CustomColors.neutral500)),
            ],
          ),
        ),
      ],
    );
  }
}
