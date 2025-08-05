import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/registrasi_vm.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

class Tahapan2 extends StatelessWidget {
  final PageController pageController;
  const Tahapan2({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    // Ambil ViewModel, listen: false karena kita hanya akan memanggil fungsi
    final viewModel = context.read<RegistrationViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text('Berapa umurmu?', style: CustomTextStyles.bold2xl), // Disesuaikan agar konsisten
          const SizedBox(height: 16),
          TextFormField(
            onChanged: (value) => viewModel.age = value, // Simpan umur ke ViewModel
            decoration: InputDecoration(
              hintText: '14',
              filled: true,
              fillColor: CustomColors.neutral50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: const Icon(Icons.check_circle, color: CustomColors.primary500),
            ),
            keyboardType: TextInputType.number,
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
              width: 382,
              height: 46,
            
            child: ElevatedButton(
              onPressed: () {
                viewModel.nextStep(); // Pindah ke langkah selanjutnya di ViewModel
                pageController.nextPage( // Pindah halaman di PageView
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primary600,
                foregroundColor: Colors.white,
                // minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                elevation: 0, // Menonaktifkan shadow bawaan agar tidak tumpang tindih
              ),
              child: Text('Lanjut', style: CustomTextStyles.semiboldBase),
            ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
