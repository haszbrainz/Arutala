import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_icons.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
        backgroundColor: const Color(0xFF2196F3),
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        elevation: 0,
        child: const Icon(ArutalaIcons.scanText, size: 32, color: Colors.white),
      ),
    );
  }
}