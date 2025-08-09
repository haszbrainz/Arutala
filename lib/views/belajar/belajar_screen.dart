import 'package:flutter/material.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

class BelajarScreen extends StatefulWidget {
  const BelajarScreen({super.key});

  @override
  State<BelajarScreen> createState() => _BelajarScreenState();
}

class _BelajarScreenState extends State<BelajarScreen> {
  int _currentLevel = 1;

  final List<String> _levelImagePaths = [
    'asset/images/step_1.png', // Ganti dengan path gambar level 1 Anda
    'asset/images/step_2.png', // Contoh untuk level 2
  ];

  // [DIUBAH] Logika sekarang menangani kondisi level terakhir
  void _handleTap() {
    // Jika belum berada di level terakhir, naik level.
    if (_currentLevel < _levelImagePaths.length) {
      setState(() {
        _currentLevel++;
      });
    } else {
      // Jika sudah di level terakhir, tampilkan dialog untuk memulai pelajaran.
      _showStartLessonDialog(context);
    }
  }

  // [BARU] Fungsi untuk menampilkan dialog memulai pelajaran
  void _showStartLessonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: CustomColors.neutral200, width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Kenali Aksara Jawa',
                  style: CustomTextStyles.bold2xl
                      .copyWith(color: CustomColors.neutral800),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kenali huruf aksara Jawa, super seru!',
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.regularLg
                      .copyWith(color: CustomColors.neutral500),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                      Navigator.pushNamed(context,
                          RouteNames.modul1); // Pindah ke halaman modul
                    },
                    icon: const Icon(Icons.play_circle, color: Colors.white),
                    label: Text('Mulai',
                        style: CustomTextStyles.semiboldBase
                            .copyWith(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primary500,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 2,
                      shadowColor: CustomColors.primary300,
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
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeaderCard(context),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: _handleTap, // Menggunakan fungsi handler baru
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Image.asset(
                      _levelImagePaths[_currentLevel - 1],
                      key: ValueKey<int>(_currentLevel),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'Gagal memuat gambar untuk Level $_currentLevel.\nPastikan path gambar benar.',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: CustomColors.primary500,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: CustomColors.primary300.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _PillTag(icon: Icons.library_books, text: 'Bab 1'),
                const SizedBox(width: 8),
                _PillTag(icon: Icons.article, text: 'Materi 1'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Pendahuluan: Karakter Aksara Jawa',
                    style:
                        CustomTextStyles.boldXl.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: 0.10,
                        strokeWidth: 6,
                        backgroundColor: CustomColors.primary300,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      Center(
                        child: Text(
                          '10%',
                          style: CustomTextStyles.semiboldBase
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _PillTag({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: CustomColors.primary600,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(text,
              style: CustomTextStyles.mediumSm.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
