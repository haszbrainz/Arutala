import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String image;
  final String description;

  const OnboardingSlide({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 281,
            height: 281,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 18,
              fontFamily: "RobotoRegular",
              color: Color(0xFF707070)
              ),
            ),
          ),
        ],
      ),
    );
  }
}