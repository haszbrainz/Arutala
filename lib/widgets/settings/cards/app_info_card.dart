import 'package:flutter/material.dart';
import 'card_container.dart';
import 'package:program_arutala/widgets/settings/list_tiles/setting_list_tile.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import '../shared/custom_divider.dart';

class AppInfoCard extends StatelessWidget {
  const AppInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      children: [
        SettingsListTile(
          icon: ArutalaIcons.info,
          title: 'Tentang Aplikasi',
          onTap: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
        const CustomDivider(),
        SettingsListTile(
          icon: ArutalaIcons.star,
          title: 'Beri Penilaian',
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        const CustomDivider(),
        SettingsListTile(
          icon: ArutalaIcons.download,
          title: 'Pembaruan Aplikasi',
          onTap: () {
            Navigator.pushNamed(context, '/update-log');
          },
        ),
      ],
    );
  }
}