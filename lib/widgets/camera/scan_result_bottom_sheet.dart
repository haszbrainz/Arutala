import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:program_arutala/themes/custom_icons.dart';
import 'package:program_arutala/view_model/scan_vm.dart';
import 'package:program_arutala/data/remote/response/api_status.dart';
import 'package:program_arutala/themes/custom_colors.dart';
import 'package:program_arutala/themes/custom_text_styles.dart';

class ScanResultBottomSheet extends StatelessWidget {
  const ScanResultBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            _DragHandle(),
            _ResultContent(),
            _ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.5,
      child: Container(
        width: 80,
        height: 4,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF9E9E9E),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _ResultContent extends StatelessWidget {
  const _ResultContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latin',
          style: CustomTextStyles.regularXs
              .copyWith(color: CustomColors.neutral900),
        ),
        const SizedBox(height: 4),
        Consumer<ScanVM>(builder: (context, viewModel, child) {
          switch (viewModel.scanModel.status) {
            case ApiStatus.INIT:
              return Text(
                '',
                style: CustomTextStyles.bold4xl
                    .copyWith(color: CustomColors.neutral900),
              );
            case ApiStatus.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ApiStatus.ERROR:
              return Text(
                'Terjadi masalah, coba lagi',
                style: CustomTextStyles.regularBase.copyWith(
                  color: Colors.red,
                ),
              );
            case ApiStatus.SUCCESS:
              return Text(
                viewModel.scanModel.data?.prediction ?? '',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              );
            default:
              return Text(
                'Terjadi masalah, coba lagi',
                style: CustomTextStyles.regularBase.copyWith(color: Colors.red),
              );
          }
        }),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Consumer<ScanVM>(
        builder: (context, viewModel, child) {
          return Row(
            children: [
              IconButton(
                  icon: const Icon(
                    ArutalaIcons.trash_2,
                    size: 24,
                    color: Colors.grey,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(
                    ArutalaIcons.copy,
                    size: 24,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    viewModel.copyToClipboard(context);
                  }),
              IconButton(
                  icon: const Icon(
                    ArutalaIcons.squareArrowOutUpRight,
                    size: 24,
                    color: Colors.grey,
                  ),
                  onPressed: () {}),
            ],
          );
        },
      ),
    );
  }
}
