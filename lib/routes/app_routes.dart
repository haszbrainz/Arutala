import 'package:flutter/material.dart';
import 'package:program_arutala/views/home/home_screen.dart';
import 'package:program_arutala/views/profil/profil_screen.dart';
import 'package:program_arutala/views/translate/scan_screen.dart';
import 'package:program_arutala/views/translate/translate_screen.dart';
import 'package:program_arutala/views/belajar/belajar_screen.dart';
import './name_routes.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {

    RouteNames.home: (context) => const HomeScreen(),
    RouteNames.profil: (context) => const ProfilScreen(),
    RouteNames.scan: (context) => const ScanScreen(),
    RouteNames.translate: (context) => const TranslateScreen(),// Pastikan LaporkanScreen ada
    RouteNames.belajar: (context) => const BelajarScreen(), // Untuk halaman 'Edit Profil'
    // RouteNames.profil: (context) => const ProfilScreen(),     // Pastikan ProfilScreen ada
    // Tambahkan pemetaan rute lain di sini
  };
}
