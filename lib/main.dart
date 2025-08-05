// lib/main.dart
import 'package:flutter/material.dart';
import 'themes/main_theme.dart';
// Import widget FloatingNavigationBar yang baru
import 'package:program_arutala/widgets/navigation/bar.dart';

void main() {
  runApp(const MainApp());
}

// backup

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      // Set FloatingNavigationBar sebagai widget utama/home
      home: const FloatingNavigationBar(initialIndex: 0),
      // Anda bisa menghapus `initialRoute` dan `routes` jika semua navigasi utama
      // dikelola sepenuhnya oleh FloatingNavigationBar.
      // initialRoute: RouteNames.home,
      // routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
