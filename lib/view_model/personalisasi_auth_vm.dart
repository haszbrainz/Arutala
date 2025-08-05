import 'package:flutter/material.dart';

class PersonalizationViewModel extends ChangeNotifier {
  // --- STATE DATA PERSONALIASASI ---
  // Simpan jawaban dari setiap langkah. Gunakan tipe data yang sesuai.
  String? selectedClass;
  String? learningFocus;
  String? dailyGoal;
  String? bonus; // Hanya satu subjek favorit
  List<String> favoriteSubjects = []; // Bisa memilih lebih dari satu

  // --- STATE UI ---
  int _currentPage = 1;
  final int totalPages = 5; // Ada 4 langkah personalisasi

  // Getter untuk mengakses state dari UI
  int get currentPage => _currentPage;
  double get progress => _currentPage / totalPages;

  // Fungsi untuk maju ke langkah berikutnya
  void nextStep() {
    if (_currentPage < totalPages) {
      _currentPage++;
      notifyListeners(); // Beri tahu UI bahwa ada perubahan state
    }
  }

  // Fungsi untuk kembali ke langkah sebelumnya
  void previousStep() {
    if (_currentPage > 1) {
      _currentPage--;
      notifyListeners();
    }
  }

  // Fungsi untuk mereset state jika pengguna mengulang alur
  void reset() {
    selectedClass = null;
    learningFocus = null;
    dailyGoal = null;
    bonus = null;
    favoriteSubjects.clear();
    _currentPage = 1;
    notifyListeners();
  }
}
