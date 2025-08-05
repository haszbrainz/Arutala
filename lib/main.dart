// lib/main.dart
import 'package:flutter/material.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'themes/main_theme.dart';
// Import widget FloatingNavigationBar yang baru
import 'package:program_arutala/widgets/navigation/bar.dart';
import 'views/autentikasi/splash/splash_screen.dart';

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
     routes: {
        RouteNames.splash: (context) => const SplashScreen(), // kunci: '/'
        RouteNames.home: (context) => const FloatingNavigationBar(initialIndex: 0), // kunci: '/home'
      },
      debugShowCheckedModeBanner: false,
    );
  }
}