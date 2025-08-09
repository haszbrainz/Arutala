import 'package:flutter/material.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

class Modul1Screen extends StatelessWidget {
  const Modul1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Kenali Aksara Jawa',
          style:
              CustomTextStyles.boldLg.copyWith(color: CustomColors.neutral800),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: CustomColors.neutral800),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'asset/images/hanacaraka.jpeg', // GANTI DENGAN PATH GAMBAR ANDA
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Gagal memuat gambar.\nPastikan path asset/images/modul1_content.png sudah benar.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.latihanIntro);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primary500,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Selanjutnya',
                  style: CustomTextStyles.semiboldBase
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
