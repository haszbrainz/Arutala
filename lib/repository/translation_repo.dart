import 'package:program_arutala/models/language.dart';
import 'package:program_arutala/models/translation_model.dart';
import 'package:program_arutala/data/remote/network/api_endpoints.dart';
import 'package:program_arutala/data/remote/network/base_api_service.dart';
import 'package:program_arutala/data/remote/network/network_api_service.dart';

class TranslationRepo {
  final BaseApiService _apiService = NetworkApiService();

  String getEndpoint(Language fromLanguage, Language toLanguage) {
    if (fromLanguage == Language.LATIN && toLanguage == Language.AKSARA) {
      return ApiEndpoints().TRANSLATE_LATIN_TO_AKSARA;
    } else if (fromLanguage == Language.AKSARA &&
        toLanguage == Language.LATIN) {
      return ApiEndpoints().TRANSLATE_AKSARA_TO_LATIN;
    } else {
      throw Exception('Unsupported translation');
    }
  }

  Future<dynamic> translate(
      String text, Language fromLanguage, Language toLanguage) async {
    try {
      final response = await _apiService
          .postResponse(getEndpoint(fromLanguage, toLanguage), {'text': text});
      return TranslationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
