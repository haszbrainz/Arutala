import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/widgets/navigation/bar.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold adalah kerangka dasar untuk sebuah layar
    return Scaffold(
      // 1. Latar belakang diubah menjadi putih
      backgroundColor: Colors.white,
      // 2. AppBar dihilangkan
      body: Center(
        // 3. Konten diletakkan di tengah layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 4. Menambahkan gambar GIF
            Image.asset(
              'asset/images/Arutala_Pengembangan.gif', // GANTI DENGAN PATH GIF ANDA
              height: 200, // Sesuaikan ukuran GIF jika perlu
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.code_off, size: 80, color: CustomColors.neutral400),
            ),
            const SizedBox(height: 24),

            // 5. Menambahkan teks
            Text(
              'Halaman Sedang Dalam Pengembangan',
              textAlign: TextAlign.center,
              style: CustomTextStyles.semiboldLg.copyWith(color: CustomColors.neutral700),
            ),
          ],
        ),
      ),
      // FloatingNavigationBar tetap ada dengan index yang sesuai
      floatingActionButton: const FloatingNavigationBar(initialIndex: 3),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
