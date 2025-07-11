import 'package:flutter/material.dart';

class CustomSegmentedProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const CustomSegmentedProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Tinggi keseluruhan yang cukup untuk memuat dot
      child: Row(
        children: [
          // Progress bar
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Layer garis penghubung
                Row(
                  children: List.generate(
                    totalSteps - 1,
                        (index) => Expanded(
                      child: Container(
                        height: 8, // Ketebalan garis penghubung
                        color: index < currentStep - 1
                            ? Color(0xFF2196F3)
                            : Color(0xFFE0E0E0),
                      ),
                    ),
                  ),
                ),
                // Layer dot dengan penomoran
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    totalSteps,
                        (index) => Container(
                      width: 25, // Ukuran dot
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < currentStep
                            ? Color(0xFF2196F3)
                            : Color(0xFFBEBEBE),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}', // Menampilkan nomor step
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: index < currentStep
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}