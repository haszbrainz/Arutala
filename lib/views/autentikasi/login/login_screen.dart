import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart'; // Sesuaikan path
import 'package:program_arutala/themes/custom_text_styles.dart'; // Sesuaikan path
import 'package:program_arutala/routes/name_routes.dart'; // Import name_routes
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:program_arutala/services/personalization_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // State untuk mengontrol visibilitas password
  bool _isPasswordObscured = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Masukkan detail anda',
          style: CustomTextStyles.mediumLg
              .copyWith(color: CustomColors.neutral900),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: CustomColors.neutral900),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 32),

              // 1. Input Fields
              TextFormField(
                controller: _emailController,
                decoration:
                    _buildInputDecoration(hintText: 'Masukkan email kamu'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                enableSuggestions: false,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _isPasswordObscured,
                decoration: _buildInputDecoration(
                  hintText: '∗∗∗∗∗∗∗∗∗∗∗∗∗∗',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: CustomColors.neutral400,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // 2. Tombol Utama
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primary700,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text;
                    final emailRegExp = RegExp(
                      r"^[A-Za-z0-9.!#\$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)+$",
                    );
                    if (email.isEmpty ||
                        !emailRegExp.hasMatch(email) ||
                        password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Email tidak valid atau password kosong')),
                      );
                      return;
                    }
                    try {
                      final res = await Supabase.instance.client.auth
                          .signInWithPassword(
                        email: email,
                        password: password,
                      );
                      if (res.session != null) {
                        // Flush pending personalization if any
                        await PersonalizationService().flushIfAny();
                        if (!mounted) return;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNames.home,
                          (Route<dynamic> route) => false,
                        );
                      }
                    } on AuthException catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message)),
                      );
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Terjadi kesalahan. Coba lagi.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.primary500,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    elevation: 0,
                  ),
                  child: Text('Masuk', style: CustomTextStyles.semiboldBase),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: CustomColors.primary500, width: 1.5),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                child: Text(
                  'Lupa kata sandi',
                  style: CustomTextStyles.semiboldBase
                      .copyWith(color: CustomColors.primary500),
                ),
              ),

              const Spacer(),

              // 3. Tombol Social Login
              _buildSocialLoginButton(
                icon: Icons.g_mobiledata,
                label: 'Masuk dengan Google',
              ),
              const SizedBox(height: 16),
              _buildSocialLoginButton(
                icon: Icons.apple,
                label: 'Masuk dengan Apple',
              ),
              const SizedBox(height: 24),

              // 4. Teks Disclaimer
              _buildDisclaimerText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      {required String hintText, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:
          CustomTextStyles.regularBase.copyWith(color: CustomColors.neutral400),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: CustomColors.neutral100.withOpacity(0.5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildSocialLoginButton(
      {required IconData icon, required String label}) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: CustomColors.neutral800),
      label: Text(
        label,
        style: CustomTextStyles.mediumBase
            .copyWith(color: CustomColors.neutral800),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: CustomColors.neutral200),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }

  Widget _buildDisclaimerText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style:
            CustomTextStyles.regularSm.copyWith(color: CustomColors.neutral400),
        children: <TextSpan>[
          const TextSpan(text: 'Dengan masuk ke Mindoro, anda setuju dengan '),
          TextSpan(
            text: 'Ketentuan',
            style: CustomTextStyles.semiboldSm
                .copyWith(color: CustomColors.primary500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Tambahkan navigasi ke halaman Ketentuan Layanan
              },
          ),
          const TextSpan(text: ' dan '),
          TextSpan(
            text: 'kebijakan privasi',
            style: CustomTextStyles.semiboldSm
                .copyWith(color: CustomColors.primary500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Tambahkan navigasi ke halaman Kebijakan Privasi
              },
          ),
          const TextSpan(text: ' kami'),
        ],
      ),
    );
  }
}
