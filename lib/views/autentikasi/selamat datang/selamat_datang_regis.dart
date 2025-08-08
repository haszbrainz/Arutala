import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/registrasi_vm.dart'; // Untuk mendapatkan nama pengguna
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart';

class WelcomeRegistrasiScreen extends StatelessWidget {
  const WelcomeRegistrasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil nama pengguna dari RegistrationViewModel
    final registrationViewModel = context.read<RegistrationViewModel>();
    // Gunakan nama jika ada, jika tidak, gunakan nama default
    final userName = registrationViewModel.name.isNotEmpty ? registrationViewModel.name : 'Pengguna Baru';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // 1. Gambar Ilustrasi
              Image.asset(
                'asset/images/arutala-1.png', // Pastikan gambar ini ada
                height: 120,
              ),
              const SizedBox(height: 32),

              // 2. Teks Sambutan
              Text(
                'Selamat datang, $userName!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold3xl.copyWith(color: CustomColors.neutral800),
              ),
              const SizedBox(height: 8),
              Text(
                'Profil kamu berhasil dibuat',
                textAlign: TextAlign.center,
                style: CustomTextStyles.regularLg.copyWith(color: CustomColors.neutral500),
              ),

              const Spacer(),

              // 3. Tombol Lanjut
              ElevatedButton(
                onPressed: () {
                  // Pindah ke home screen dan hapus semua halaman sebelumnya
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.home, // Arahkan ke rute home
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primary500, // Warna biru
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                child: Text(
                  'Lanjut',
                  style: CustomTextStyles.semiboldBase.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
