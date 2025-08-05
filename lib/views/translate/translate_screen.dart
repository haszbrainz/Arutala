import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/translation_vm.dart';
import 'package:program_arutala/widgets/translate/app_bar/custom_app_bar_translate.dart';
import 'package:program_arutala/widgets/navigation/bar.dart';
import 'package:program_arutala/views/translate/translate_body.dart';
// import 'package:program_arutala/themes/custom_colors.dart'; // Impor tema warna
import 'package:program_arutala/views/translate/scan_screen.dart'; // Impor layar scan
class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  TranslateScreenState createState() => TranslateScreenState();
}

class TranslateScreenState extends State<TranslateScreen> {
  // --- WIDGET HELPER UNTUK MEMBUAT TOMBOL IKON ---
  Widget _buildActionButton(
      {required IconData icon,
      required double size,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF0D63D7), // Warna biru dari gambar
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0D63D7).withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Icon(icon, color: Colors.white, size: size * 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TranslationVM(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        // floatingActionButton: const FloatingNavigationBar(initialIndex: 2),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBarTranslate(),
        ),
        backgroundColor: const Color(0xFFF0F0F0),
        // --- BODY DIUBAH MENJADI STACK ---
        body: Stack(
          children: [
            // Konten utama tetap sama
            const TranslationBody(),

            // --- DERETAN IKON BARU ---
            Positioned(
              bottom: 90, // Posisikan di atas Floating Navigation Bar
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Tombol Galeri (kiri)
                  _buildActionButton(
                    icon: Icons.add_photo_alternate_outlined,
                    size: 48.0,
                    onTap: () {
                      print('Tombol Galeri ditekan');
                      // TODO: Implementasi logika buka galeri
                    },
                  ),
                  const SizedBox(width: 24),
                  // Tombol Kamera (tengah)
                  _buildActionButton(
                    icon: Icons.camera_alt,
                    size: 72.0,
                    onTap: () {
                      // --- LOGIKA NAVIGASI BARU ---
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ScanScreen()),
                      );
                    },
                  ),
                  const SizedBox(width: 24),
                  // Tombol Mikrofon (kanan)
                  _buildActionButton(
                    icon: Icons.mic,
                    size: 48.0,
                    onTap: () {
                      print('Tombol Mikrofon ditekan');
                      // TODO: Implementasi logika rekam suara
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}