import 'package:flutter/material.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

/// Halaman sukses setelah user menjawab benar.
/// Mengacu pada desain referensi: maskot, judul, subjudul, tiga kartu statistik, dan tombol aksi.
class BerhasilScreen extends StatelessWidget {
  const BerhasilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Spacer(),
              Center(
                child: Image.asset(
                  'asset/images/latihan_owl.png',
                  height: 180,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.emoji_events,
                    size: 120,
                    color: CustomColors.primary300,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Jagoan aksara!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold3xl
                    .copyWith(color: CustomColors.primary700),
              ),
              const SizedBox(height: 12),
              Text(
                'Kamu sudah hafal 10 huruf!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.semiboldLg
                    .copyWith(color: CustomColors.neutral500),
              ),
              const SizedBox(height: 28),
              Row(
                children: const [
                  Expanded(
                    child: _StatCard(
                      leading: 'XP',
                      label: 'Total XP',
                      value: '30',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      leading: '🏃',
                      label: 'Sempurna',
                      value: '100%',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      leading: '⏱️',
                      label: 'Gercep',
                      value: '1:27',
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Kembali ke halaman Belajar dan bersihkan tumpukan.
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.belajar,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.primary500,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Klaim XP',
                    style: CustomTextStyles.semiboldBase
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String leading;
  final String label;
  final String value;

  const _StatCard({
    required this.leading,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: CustomColors.primary200),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: CustomColors.primary50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                leading,
                style: CustomTextStyles.semiboldXs
                    .copyWith(color: CustomColors.primary600),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: CustomTextStyles.regularXs
                .copyWith(color: CustomColors.neutral600),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: CustomTextStyles.boldXs
                .copyWith(color: CustomColors.primary700),
          ),
        ],
      ),
    );
  }
}
