// file: lib/view/translate/widgets/output_text_field.dart
import 'package:flutter/material.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/data/remote/response/api_status.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import 'package:program_arutala/view_model/translation_vm.dart';

class OutputTextField extends StatelessWidget {
  const OutputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
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
            padding: const EdgeInsets.only(top: 28, left: 16, right: 16),
            child: Consumer<TranslationVM>(
              builder: (context, viewModel, child) {
                return TranslatedContent(viewModel: viewModel);
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
                viewModel.isLatinToAksara ? 'Aksara' : 'Latin',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Consumer<TranslationVM>(
            builder: (context, viewModel, child) {
              return ActionButtons(viewModel: viewModel);
            },
          ),
        ),
      ],
    );
  }
}

class TranslatedContent extends StatelessWidget {
  final TranslationVM viewModel;

  const TranslatedContent({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (viewModel.translationModel.status) {
      case ApiStatus.INIT:
        return const Text('',
            style: TextStyle(fontSize: 16, color: Colors.black));
      case ApiStatus.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ApiStatus.ERROR:
        return const Text(
          'Terjadi masalah, coba lagi',
          style: TextStyle(fontSize: 16, color: Colors.black),
        );
      case ApiStatus.SUCCESS:
        return Text(
          viewModel.translationModel.data?.translatedText ?? '',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily:
                viewModel.isLatinToAksara ? 'NotoSansJavanese' : 'Roboto',
          ),
        );
      default:
        return const Text(
          'Terjadi masalah, coba lagi',
          style: TextStyle(fontSize: 16, color: Colors.black),
        );
    }
  }
}

class ActionButtons extends StatelessWidget {
  final TranslationVM viewModel;

  const ActionButtons({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            ArutalaIcons.copy,
            size: 24,
            color: Colors.grey,
          ),
          onPressed: () {
            viewModel.copyToClipboard(context);
          },
        ),
        IconButton(
          icon: const Icon(
            ArutalaIcons.squareArrowOutUpRight,
            size: 24,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            ArutalaIcons.expand,
            size: 24,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
