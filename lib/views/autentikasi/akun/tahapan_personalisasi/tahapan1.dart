import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/personalisasi_auth_vm.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';
// [DIHAPUS] Import name_routes tidak lagi diperlukan di sini

class Tahapan1 extends StatefulWidget {
  final PageController pageController;
  const Tahapan1({super.key, required this.pageController});

  @override
  State<Tahapan1> createState() => _Tahapan1State();
}

class _Tahapan1State extends State<Tahapan1> {
  String? _selectedClass;

  final List<String> _classOptions = [
    'I (Satu)', 'II (Dua)', 'III (Tiga)',
    'IV (Empat)', 'V (Lima)', 'VI (Enam)'
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<PersonalizationViewModel>();

    // [DIHAPUS] PopScope tidak lagi diperlukan di sini
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Row(
            children: [
              // [DIKEMBALIKAN] Menjadi Icon biasa, bukan IconButton
              const Icon(Icons.door_front_door_outlined, size: 32, color: CustomColors.neutral500),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Wah, kamu menempuh kelas berapa saat ini?',
                  style: CustomTextStyles.mediumXl,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          ..._classOptions.map((option) {
            bool isSelected = _selectedClass == option;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _ChoiceButton(
                text: option,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    _selectedClass = option;
                  });
                },
              ),
            );
          }).toList(),

          const Spacer(),

          ElevatedButton(
            onPressed: _selectedClass == null ? null : () {
              viewModel.selectedClass = _selectedClass;
              viewModel.nextStep();
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.primary500,
              disabledBackgroundColor: CustomColors.neutral200,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            child: Text('Selanjutnya', style: CustomTextStyles.semiboldBase.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// Widget _ChoiceButton tidak perlu diubah
class _ChoiceButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChoiceButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.primary100.withOpacity(0.5) : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isSelected ? CustomColors.primary500 : CustomColors.neutral200,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: CustomTextStyles.mediumBase.copyWith(
            color: isSelected ? CustomColors.primary700 : CustomColors.neutral700,
          ),
        ),
      ),
    );
  }
}