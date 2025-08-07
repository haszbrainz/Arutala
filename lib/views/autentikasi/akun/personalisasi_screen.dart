import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/personalisasi_auth_vm.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/routes/name_routes.dart'; // <-- PERBAIKAN: Import yang hilang ditambahkan di sini

// Import halaman-halaman langkah personalisasi
import 'tahapan_personalisasi/tahapan1.dart';
import 'tahapan_personalisasi/tahapan2.dart';
import 'tahapan_personalisasi/tahapan3.dart';
import 'tahapan_personalisasi/tahapan4.dart';

class PersonalizationFlowScreen extends StatefulWidget {
  const PersonalizationFlowScreen({super.key});

  @override
  State<PersonalizationFlowScreen> createState() =>
      _PersonalizationFlowScreenState();
}

class _PersonalizationFlowScreenState extends State<PersonalizationFlowScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PersonalizationViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: CustomColors.neutral900),
          onPressed: () {
            // --- LOGIKA PERBAIKAN DI SINI ---
            if (viewModel.currentPage > 1) {
              // Jika bukan halaman pertama, kembali ke langkah sebelumnya
              viewModel.previousStep();
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else {
              // Jika ini adalah halaman pertama, kembali ke halaman intro
              Navigator.pushReplacementNamed(
                context,
                RouteNames.selamatpersonalisasi,
              );
            }
          },
        ),
        title: SizedBox(
          height: 8,
          child: LinearProgressIndicator(
            value: viewModel.progress,
            backgroundColor: CustomColors.neutral200,
            color: CustomColors.primary500,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // Daftarkan 4 halaman langkah Anda di sini
           Tahapan1(pageController: _pageController),
           Tahapan2(pageController: _pageController),
           Tahapan3(pageController:_pageController), // <-- PERBAIKAN: Tambahkan Step2Lesson
           Tahapan4(pageController: _pageController), // <-- PERBAIKAN: Tamb
        ],
      ),
    );
  }
}
