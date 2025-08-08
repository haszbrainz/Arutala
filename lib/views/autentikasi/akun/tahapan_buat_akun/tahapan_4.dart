import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/registrasi_vm.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart';

// [DIUBAH] Widget diubah menjadi StatefulWidget
class Tahapan4 extends StatefulWidget {
  final PageController pageController;
  const Tahapan4({super.key, required this.pageController});

  @override
  State<Tahapan4> createState() => _Tahapan4State();
}

class _Tahapan4State extends State<Tahapan4> {
  // State untuk mengontrol visibilitas password
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegistrationViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text('Buat kata sandi yang aman', style: CustomTextStyles.bold2xl.copyWith(color: CustomColors.neutral700)),
          const SizedBox(height: 16),
          TextFormField(
            onChanged: (value) => viewModel.password = value,
            // [DIUBAH] obscureText sekarang menggunakan state
            obscureText: _isPasswordObscured,
            decoration: InputDecoration(
              hintText: 'Masukan kata sandi',
              hintStyle: CustomTextStyles.boldBase.copyWith(color: CustomColors.neutral200),
              filled: true,
              fillColor: CustomColors.neutral50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              // [DIUBAH] Menambahkan ikon mata sebagai suffixIcon
              suffixIcon: IconButton(
                icon: Icon(
                  // Mengubah ikon berdasarkan state
                  _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                  color: CustomColors.neutral500,
                ),
                onPressed: () {
                  // Mengubah state saat ikon ditekan
                  setState(() {
                    _isPasswordObscured = !_isPasswordObscured;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          const Spacer(),
          // [DIUBAH] Tombol sekarang dibungkus dengan Container untuk menambahkan shadow
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
              width: double.infinity, // Menggunakan double.infinity agar lebar penuh
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.selamatpersonalisasi,
                    (route) => false,
                  );
                },
                // [DIUBAH] Style disesuaikan dengan Tahapan 3
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primary600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  elevation: 0, // Menonaktifkan shadow bawaan
                ),
                // [DIUBAH] Style text disesuaikan dengan Tahapan 3
                child: Text('Lanjut', style: CustomTextStyles.semiboldBase.copyWith(
                  color: Colors.white,
                )),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
