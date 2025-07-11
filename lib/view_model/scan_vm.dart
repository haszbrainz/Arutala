import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:program_arutala/models/scan_model.dart';
import 'package:program_arutala/models/language.dart';
import 'package:program_arutala/repository/scan_repo.dart';
import 'package:program_arutala/data/remote/response/api_response.dart';

class ScanVM extends ChangeNotifier {
  final _repo = ScanRepo();
  Language fromLanguage = Language.AKSARA;
  Language toLanguage = Language.LATIN;

  ApiResponse<ScanModel> scanModel = ApiResponse.init();

  void _setResultScan(ApiResponse<ScanModel> response) {
    scanModel = response;
    notifyListeners();
  }

  Future<void> fetchScan(String imagePath) async {
    _setResultScan(ApiResponse.loading());
    try {
      final result = await _repo.scan(imagePath, fromLanguage, toLanguage);
      _setResultScan(ApiResponse.success(result));
    } catch (e) {
      _setResultScan(ApiResponse.error(e.toString()));
    }
  }

  void copyToClipboard(BuildContext context) async {
    try {
      final textToCopy = scanModel.data?.prediction;
      if (textToCopy != null && textToCopy.isNotEmpty) {
        await Clipboard.setData(ClipboardData(text: textToCopy));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil disalin ke papan klip'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tidak ada teks untuk disalin'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyalin: ${e.toString()}'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void clearScan() {
    scanModel = ApiResponse.loading();
    notifyListeners();
  }
}
