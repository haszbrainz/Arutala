// file: lib/view/translate/widgets/language_switcher.dart
import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_icons.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool isLatinToAksara;
  final VoidCallback onSwitchPressed;

  const LanguageSwitcher({
    Key? key,
    required this.isLatinToAksara,
    required this.onSwitchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LanguageContainer(
          text: isLatinToAksara ? 'Latin' : 'Aksara',
        ),
        SwitchButton(onPressed: onSwitchPressed),
        LanguageContainer(
          text: isLatinToAksara ? 'Aksara' : 'Latin',
        ),
      ],
    );
  }
}

class LanguageContainer extends StatelessWidget {
  final String text;

  const LanguageContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF2196F3),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SwitchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SwitchButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.white,
      ),
      child: const Icon(
        ArutalaIcons.arrowLeftRight,
        color: Color(0xFF2196F3),
        size: 16,
      ),
    );
  }
}