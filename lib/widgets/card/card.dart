import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

/// Kartu kustom untuk ditampilkan dalam GridView dengan gambar latar,
/// ikon, dan teks yang bisa disesuaikan.
class GridItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String backgroundImagePath;
  final String iconPath; // Parameter untuk gambar ikon
  final VoidCallback? onTap;

  const GridItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundImagePath,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 181,
        height: 229,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(backgroundImagePath),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              // Error handling jika gambar gagal dimuat
            },
          ),
        ),
        // Menggunakan Column untuk mengatur tata letak vertikal
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- GAMBAR IKON ---
              Image.asset(
                iconPath,
                height: 70, // Atur ukuran ikon
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50, color: Colors.white);
                },
              ),

              // --- TULISAN (TITLE & SUBTITLE) ---
              Column(
                children: [
                  Text(
                    title,
                    style: CustomTextStyles.boldLg.copyWith(
                      color: CustomColors.primary900,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 0),
                  Text(
                    subtitle,
                    style: CustomTextStyles.regularXs.copyWith(
                      color: CustomColors.primary700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // --- TOMBOL BARU ---
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primary700, // Biru solid, efek 3D
                      spreadRadius: -1,
                      offset:
                          const Offset(0, 3), // Shadow solid di bawah tombol
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(153, 32), // Ukuran w153 h32
                    backgroundColor:
                        CustomColors.primary500, // Warna biru dari gambar
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.zero,
                    elevation: 0, // Shadow diatur oleh Container
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mainkan',
                        style: CustomTextStyles.semiboldBase
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.play_circle_fill,
                          color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
