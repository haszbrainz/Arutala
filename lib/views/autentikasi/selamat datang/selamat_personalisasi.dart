import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart'; // Pastikan ini di-import

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
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primary700,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      // [DIPERBAIKI] Memperbaiki panggilan Navigator
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.personalisasi, // Menggunakan konstanta dari RouteNames
                        (Route<dynamic> route) => false, // Menambahkan predicate untuk menghapus semua rute
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primary600,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      elevation: 0,
                    ),
                    child: Text('Lanjut', style: CustomTextStyles.semiboldBase.copyWith(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
