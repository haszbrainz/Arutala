import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
import 'package:program_arutala/routes/name_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold adalah kerangka dasar untuk sebuah layar
    final user = Supabase.instance.client.auth.currentUser;
    final displayName =
        ((user?.userMetadata?['full_name'] as String?)?.trim().isNotEmpty ==
                true)
            ? (user?.userMetadata?['full_name'] as String)
            : 'Pengguna';
    final email = user?.email ?? '-';

    String _initials(String name) {
      final parts = name.trim().split(RegExp(r'\s+'));
      if (parts.isEmpty) return 'U';
      final first = parts.first.isNotEmpty ? parts.first[0] : '';
      final last =
          parts.length > 1 && parts.last.isNotEmpty ? parts.last[0] : '';
      final init = (first + last).toUpperCase();
      return init.isNotEmpty ? init : 'U';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: CustomColors.neutral700),
            tooltip: 'Keluar',
            onPressed: () async {
              if (user == null) {
                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.login,
                  (route) => false,
                );
                return;
              }
              try {
                await Supabase.instance.client.auth.signOut();
              } catch (_) {}
              if (!context.mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.login,
                (route) => false,
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              // Avatar + Nama
              CircleAvatar(
                radius: 40,
                backgroundColor: CustomColors.neutral100,
                child: Text(
                  _initials(displayName),
                  style: CustomTextStyles.bold2xl
                      .copyWith(color: CustomColors.neutral700),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                displayName,
                style: CustomTextStyles.boldLg
                    .copyWith(color: CustomColors.neutral900),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: CustomTextStyles.regularBase
                    .copyWith(color: CustomColors.neutral500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Divider(color: CustomColors.neutral200),
              const SizedBox(height: 24),

              // Info sederhana (tetap konsisten gaya)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user,
                      color: CustomColors.primary500, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Akun Aktif',
                    style: CustomTextStyles.semiboldSm
                        .copyWith(color: CustomColors.neutral700),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
