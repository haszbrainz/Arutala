// file: lib/view/translate/widgets/input_text_field.dart
import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/view_model/translation_vm.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: CustomColors.primary400,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Consumer<TranslationVM>(
              builder: (context, viewModel, child) {
                return TextField(
                  controller: viewModel.textTopController,
                  maxLines: 4,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Ketikkan kata atau kalimat',
                    hintStyle: TextStyle(color: CustomColors.neutral400),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: InputBorder.none,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 14,
          child: Consumer<TranslationVM>(
            builder: (context, viewModel, child) {
              return Text(
                viewModel.isLatinToAksara ? 'Latin' : 'Aksara',
                style: const TextStyle(
                  color: CustomColors.primary400,
                  fontSize: 12,
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          child: Consumer<TranslationVM>(
            builder: (context, viewModel, child) {
              return IconButton(
                icon: const Icon(Icons.clear),
                onPressed: viewModel.clearTextTop,
              );
            },
          ),
        ),
      ],
    );
  }
}