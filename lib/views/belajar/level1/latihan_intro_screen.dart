import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart';
class LatihanIntroScreen extends StatelessWidget {
  const LatihanIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: CustomColors.neutral400),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const LinearProgressIndicator(
            value: 0.1, // Progress awal
            minHeight: 10,
            backgroundColor: CustomColors.neutral200,
            valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primary500),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Ganti dengan path gambar Anda di assets
              Image.asset(
                'asset/images/latihan_owl.png',
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.school,
                      size: 150, color: CustomColors.primary300);
                },
              ),
              const SizedBox(height: 48),
              Text(
                'Asah Kemahiran Aksara Jawamu!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold2xl
                    .copyWith(color: CustomColors.neutral800),
              ),
              const SizedBox(height: 16),
              Text(
                'Saatnya melatih kemampuan membaca dan menulis aksara Jawa! Yuk, persiapkan dirimu dengan latihan yang asyik dan buktikan seberapa mahir kamu!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.regularLg
                    .copyWith(color: CustomColors.neutral500),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.latihanSoal);
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
            ],
          ),
        ),
      ),
    );
  }
}
