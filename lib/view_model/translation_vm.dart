import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:program_arutala/models/language.dart';
import 'package:program_arutala/models/translation_model.dart';
import 'package:program_arutala/data/remote/response/api_response.dart';
import 'package:program_arutala/repository/translation_repo.dart';

class TranslationVM extends ChangeNotifier {
  final _repo = TranslationRepo();
  bool isLatinToAksara = true;
  final TextEditingController textTopController = TextEditingController();
  Timer? _debounce;

  ApiResponse<TranslationModel> translationModel = ApiResponse.init();

  TranslationVM() {
    textTopController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchTranslation(
          textTopController.text,
          isLatinToAksara ? Language.LATIN : Language.AKSARA,
          isLatinToAksara ? Language.AKSARA : Language.LATIN);
    });
  }

  void _setResultTranslation(ApiResponse<TranslationModel> response) {
    translationModel = response;
    notifyListeners();
  }

  Future<void> fetchTranslation(
      String text, Language fromLanguage, Language toLanguage) async {
    _setResultTranslation(ApiResponse.loading());
    try {
      final result = await _repo.translate(text, fromLanguage, toLanguage);
      _setResultTranslation(ApiResponse.success(result));
    } catch (e) {
      _setResultTranslation(ApiResponse.error(e.toString()));
    }
  }

  void clearTextTop() {
    textTopController.clear();
    notifyListeners();
  }

  void toogleLanguage() {
    isLatinToAksara = !isLatinToAksara;
    textTopController.text = translationModel.data?.translatedText ?? '';
    notifyListeners();
  }

  void copyToClipboard(BuildContext context) {
    Clipboard.setData(
        ClipboardData(text: translationModel.data?.translatedText ?? ''));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Berhasil salin di papanklip')),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    textTopController.dispose();
    super.dispose();
  }
}
