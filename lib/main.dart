// lib/main.dart
import 'package:flutter/material.dart';
import 'package:program_arutala/routes/app_routes.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'themes/main_theme.dart';
// Import widget FloatingNavigationBar yang baru
import 'package:program_arutala/widgets/navigation/bar.dart';
import 'views/autentikasi/splash/splash_screen.dart';
import 'views/autentikasi/akun/onboarding_screen.dart'; // Import OnboardingScreen
import 'package:program_arutala/views/autentikasi/akun/registrasi_screen.dart'; // Import RegistrationFlowScreen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      initialRoute: RouteNames.splash, // Rute awal aplikasi
      // Set FloatingNavigationBar sebagai widget utama/home
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
