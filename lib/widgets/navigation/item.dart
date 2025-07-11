import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  decoration: isActive
      ? BoxDecoration(
          // 1. Gunakan properti 'gradient' sebagai pengganti 'color'
          gradient: const RadialGradient(
            // 2. Daftar warna gradasi Anda
            colors: [
              Color(0xFF0B1061),
              Color(0xFF087CE3), // Warna terang (tengah)
               // Warna gelap (pinggir)
            ],
            // 3. Atur pusat dan radius gradasi (opsional)
            center: Alignment.topLeft,
            radius: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        )
      : BoxDecoration(
          // Jika tidak aktif, tetap transparan
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : CustomColors.neutral700,
              size: 20,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: CustomTextStyles.semiboldSm.copyWith(color: Colors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

