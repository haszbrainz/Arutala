// lib/loading_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart'; // Sesuaikan dengan path Anda
import 'package:program_arutala/themes/custom_text_styles.dart'; // Tambahkan import ini

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5500), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Image.asset(
              'assets/images/arutala-1.gif',
              width: 244, // Anda bisa sesuaikan ukuran GIF di sini
            ),
            const SizedBox(height: 24), // Jarak antara GIF dan teks

            // 2. Tambahkan teks "memuat..."
            Text(
              'memuat...',
              style: CustomTextStyles.mediumLg.copyWith(
                color: CustomColors.neutral300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}