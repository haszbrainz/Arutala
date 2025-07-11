import 'package:program_arutala/models/language.dart';
import 'package:program_arutala/models/scan_model.dart';
import 'package:program_arutala/data/remote/network/api_endpoints.dart';
import 'package:program_arutala/data/remote/network/base_api_service.dart';
import 'package:program_arutala/data/remote/network/network_api_service.dart';  


class ScanRepo {
  final BaseApiService _apiService = NetworkApiService();

  String getEndpoint(Language fromLanguage, Language toLanguage) {
    if (fromLanguage == Language.LATIN && toLanguage == Language.AKSARA) {
      return ApiEndpoints().SCAN_TO_AKSARA;
    } else if (fromLanguage == Language.AKSARA &&
        toLanguage == Language.LATIN) {
      return ApiEndpoints().SCAN_TO_LATIN;
    } else {
      throw Exception('Unsupported translation');
    }
  }

  Future<dynamic> scan(
      String imagePath, Language fromLanguage, Language toLanguage) async {
    try {
      final response = await _apiService
          .postFormResponse(getEndpoint(fromLanguage, toLanguage), imagePath);
      return ScanModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}