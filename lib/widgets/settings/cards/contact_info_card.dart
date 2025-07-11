import 'package:flutter/material.dart';
import 'card_container.dart';
import 'package:program_arutala/widgets/settings/list_tiles/setting_list_tile.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import '../shared/custom_divider.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      children: [
        SettingsListTile(
          icon: ArutalaIcons.globe,
          title: 'www.arutalaaksara.com',
          onTap: () {
            // Handle button tap
          },
        ),
        const CustomDivider(),
        SettingsListTile(
          icon: ArutalaIcons.mail,
          title: 'arutala.app@gmail.com',
          onTap: () {
            // Handle button tap
          },
        ),
        const CustomDivider(),
        SettingsListTile(
          icon: ArutalaIcons.instagram,
          title: '@arutala.app',
          onTap: () {
            // Handle button tap
          },
        ),
        const CustomDivider(),
        SettingsListTile(
          icon: ArutalaIcons.facebook,
          title: 'Arutala App',
          onTap: () {
            // Handle button tap
          },
        ),
        const CustomDivider(),
        SettingsListTile(
          icon: ArutalaIcons.linkedin,
          title: 'Arutala App',
          onTap: () {
            // Handle button tap
          },
        ),
      ],
    );
  }
}