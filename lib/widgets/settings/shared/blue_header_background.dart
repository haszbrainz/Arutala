import 'package:flutter/material.dart';

class BlueHeaderBackground extends StatelessWidget {
  const BlueHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 128,
        decoration: const BoxDecoration(
          color: Color(0xFF2196F3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}