import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

class PersonalizationIntroScreen extends StatelessWidget {
  const PersonalizationIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Ganti dengan ikon atau gambar perkenalan Anda
              const Icon(Icons.auto_awesome, size: 80, color: CustomColors.primary500),
              const SizedBox(height: 32),
              Text(
                'Selamat Datang!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold4xl,
              ),
              const SizedBox(height: 16),
              Text(
                'Ayo siapkan pengalaman belajarmu. Jawab beberapa pertanyaan singkat agar kami bisa menyesuaikan materi untukmu.',
                textAlign: TextAlign.center,
                style: CustomTextStyles.regularLg.copyWith(color: CustomColors.neutral600),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Ganti halaman ini dengan alur personalisasi
                  Navigator.pushReplacementNamed(context, '/personalization_flow');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primary500,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                child: Text('Mulai', style: CustomTextStyles.semiboldBase.copyWith(color: Colors.white)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
