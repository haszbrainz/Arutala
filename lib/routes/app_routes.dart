import 'package:flutter/material.dart';
import 'package:program_arutala/views/autentikasi/login/login_screen.dart';
import 'package:program_arutala/views/belajar/level1/modul1_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:program_arutala/views/translate/scan_screen.dart';

import 'package:program_arutala/views/autentikasi/akun/registrasi_screen.dart';
import 'package:program_arutala/views/autentikasi/loading/loading_screen.dart';
import 'package:program_arutala/views/autentikasi/selamat%20datang/selamat_datang_regis.dart';
import 'package:program_arutala/views/autentikasi/selamat%20datang/selamat_personalisasi.dart';
import 'package:program_arutala/views/autentikasi/akun/personalisasi_screen.dart';
import 'package:program_arutala/views/autentikasi/splash/splash_screen.dart';
import 'package:program_arutala/views/autentikasi/akun/onboarding_screen.dart';
import 'package:program_arutala/views/belajar/level1/latihan_intro_screen.dart';
import 'package:program_arutala/views/belajar/level1/latihan_soal_screen.dart';
import 'package:program_arutala/views/belajar/level1/berhasil_screen.dart';
import 'package:program_arutala/widgets/navigation/bar.dart';
import 'package:program_arutala/view_model/personalisasi_auth_vm.dart';
import 'package:program_arutala/view_model/registrasi_vm.dart';
// import 'package:program_arutala/views/belajar/modul1_screen.dart';
import './name_routes.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splash: (context) => const SplashScreen(),
    RouteNames.onBoarding: (context) => const OnboardingScreen(),
    RouteNames.regisflow: (context) => const RegistrationFlowScreen(),
    RouteNames.selamatpersonalisasi: (context) =>
        const PersonalizationIntroScreen(),
    RouteNames.personalisasi: (context) => const PersonalizationFlowScreen(),
    RouteNames.welcomeRegistrasi: (context) => const WelcomeRegistrasiScreen(),
    RouteNames.scan: (context) => const ScanScreen(),
    RouteNames.loading: (context) => const LoadingScreen(),
    RouteNames.login: (context) => const LoginScreen(),
    RouteNames.modul1: (context) => const Modul1Screen(),
    RouteNames.latihanIntro: (context) => const LatihanIntroScreen(),
    RouteNames.latihanSoal: (context) => const LatihanSoalScreen(),
    RouteNames.berhasilLatihan: (context) => const BerhasilScreen(),
    RouteNames.home: (context) => const FloatingNavigationBar(initialIndex: 0),
    RouteNames.belajar: (context) =>
        const FloatingNavigationBar(initialIndex: 1),
    RouteNames.translate: (context) =>
        const FloatingNavigationBar(initialIndex: 2),
    RouteNames.profil: (context) =>
        const FloatingNavigationBar(initialIndex: 3),
  };
}

// Class AppProviders tidak perlu diubah
class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => PersonalizationViewModel()),
    ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
  ];
}
