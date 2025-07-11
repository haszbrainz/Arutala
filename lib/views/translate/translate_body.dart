import 'package:flutter/material.dart';
import 'package:program_arutala/widgets/translate/input_output/input_text_field.dart';
import 'package:program_arutala/widgets/translate/input_output/output_text_field.dart';

class TranslationBody extends StatelessWidget {
  const TranslationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          // Text Input Field
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 32),
            child: InputTextField(),
          ),
          // Output Field
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 32),
            child: OutputTextField(),
          ),
        ],
      ),
    );
  }
}