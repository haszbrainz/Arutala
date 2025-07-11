import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/widgets/navigation/bar.dart';

class BelajarScreen extends StatelessWidget {
  const BelajarScreen({super.key});

  // Fungsi untuk menampilkan dialog "Dalam Pengembangan"
  void _showDevelopmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: 228,
            height: 240,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar GIF
                Image.asset(
                  'asset/images/Arutala_Pengembangan.gif', // Ganti dengan path GIF Anda
                  height: 100,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.code_off,
                      size: 60,
                      color: CustomColors.neutral400),
                ),
                Text(
                  'Fitur Sedang Dalam Pengembangan',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.semiboldBase
                      .copyWith(color: CustomColors.neutral700),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Kembali',
                      style: CustomTextStyles.semiboldSm
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar dihilangkan
      // 2. Body diubah menjadi GestureDetector untuk menangkap event 'tap'
      body: GestureDetector(
        onTap: () {
          _showDevelopmentDialog(context);
        },
        // 3. Container dengan gambar sebagai latar belakang
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/belajar_screen.png'), // GANTI DENGAN PATH GAMBAR ANDA
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      // FloatingNavigationBar tetap ada dengan index yang sesuai
      floatingActionButton: const FloatingNavigationBar(initialIndex: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
