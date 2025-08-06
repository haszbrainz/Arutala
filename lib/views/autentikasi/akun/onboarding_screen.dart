import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // 1. Gambar Ilustrasi Utama
              Image.asset(
                'asset/images/arutala-1.png',
                height: 390, // Sesuaikan ukuran gambar
              ),
              const SizedBox(height: 50),
              Text(
                'Penyelesaian masalah interaktif yang efektif dan menyenangkan. Jadilah lebih pintar dalam 15 menit sehari.',
                textAlign: TextAlign.center,
                style: CustomTextStyles.regularLg.copyWith(
                  color: CustomColors.neutral700,
                ),
              ),
              const Spacer(flex: 2),

              // Tombol "Lanjutkan" dengan desain asli
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primary700, // <-- Desain shadow dikembalikan ke asli
                      offset: const Offset(0, 4), // Posisi shadow Y=4
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SizedBox(
                  width: 382,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/regis-flow');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primary600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: Text(
                      'Lanjutkan',
                      style: CustomTextStyles.semiboldBase,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Saya sudah punya akun',
                  style: CustomTextStyles.semiboldBase.copyWith(
                    color: CustomColors.neutral800,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}