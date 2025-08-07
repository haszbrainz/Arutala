// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Pastikan provider di-import
import 'package:program_arutala/routes/app_routes.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'package:program_arutala/themes/main_theme.dart';


void main() {
  runApp(
    // 2. Bungkus aplikasi dengan MultiProvider
    MultiProvider(
      // 3. Panggil daftar provider dari class AppProviders
      providers: AppProviders.providers,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      initialRoute: RouteNames.splash,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
