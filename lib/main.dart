import 'package:flutter/material.dart';
import 'package:program_arutala/routes/app_routes.dart';
import 'themes/main_theme.dart';
import 'routes/app_routes.dart';
import 'routes/name_routes.dart';


void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      initialRoute: RouteNames.home,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
