import 'package:flutter/material.dart';
import '../../buttons/nav_bar_button.dart';
import 'package:program_arutala/themes/custom_icons.dart';
class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: 80,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 12,
      shadowColor: Colors.black,
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarButton(
            icon: ArutalaIcons.aksara,
            label: 'Terjemah',
            isActive: false,
            onPressed: () {
              Navigator.pushNamed(context, '/translate');
            },
          ),
          NavBarButton(
            icon: ArutalaIcons.settings,
            label: 'Pengaturan',
            isActive: true,
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}