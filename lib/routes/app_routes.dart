import 'package:flutter/material.dart';
import 'package:program_arutala/views/home/home_screen.dart';
import 'package:program_arutala/views/profil/profil_screen.dart';
import 'package:program_arutala/views/translate/scan_screen.dart';
import 'package:program_arutala/views/translate/translate_screen.dart';
import 'package:program_arutala/views/belajar/belajar_screen.dart';
import 'package:program_arutala/views/autentikasi/akun/registrasi_screen.dart';
import 'package:program_arutala/views/autentikasi/loading/loading_screen.dart';
import 'package:program_arutala/views/autentikasi/selamat%20datang/selamat_datang_regis.dart';
import 'package:program_arutala/views/autentikasi/selamat%20datang/selamat_personalisasi.dart';
import 'package:program_arutala/views/autentikasi/akun/personalisasi_screen.dart';
import 'package:program_arutala/views/autentikasi/splash/splash_screen.dart';
import 'package:program_arutala/views/autentikasi/akun/onboarding_screen.dart';
import './name_routes.dart';
class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splash: (context) => const SplashScreen(),
    RouteNames.onBoarding: (context) => const OnboardingScreen(),
    RouteNames.regisflow: (context) => const RegistrationFlowScreen(),
    RouteNames.selamatpersonalisasi: (context) => const PersonalizationIntroScreen(),
    RouteNames.personalisasi: (context) => const PersonalizationFlowScreen (),
    RouteNames.welcomeRegistrasi: (context) => const WelcomeRegistrasiScreen(),
    RouteNames.home: (context) => const HomeScreen(),
    RouteNames.profil: (context) => const ProfilScreen(),
    RouteNames.scan: (context) => const ScanScreen(),
    RouteNames.translate: (context) => const TranslateScreen(),
    RouteNames.belajar: (context) => const BelajarScreen(),
    RouteNames.loading: (context) => const LoadingScreen(),
  };
}
