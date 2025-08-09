// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Pastikan provider di-import
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:program_arutala/routes/app_routes.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'package:program_arutala/themes/main_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ounflukoilvrtmtpeeid.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im91bmZsdWtvaWx2cnRtdHBlZWlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ3NDUyNDMsImV4cCI6MjA3MDMyMTI0M30.DgbRcCmMiGZRaN7UaZTzbVxlEUPvlSG5oyojUrRI6vw',
    debug: true,
  );

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
