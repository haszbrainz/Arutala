// lib/viewmodels/registration_view_model.dart  (buat folder baru jika perlu)

import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  // --- STATE DATA REGISTRASI ---
  String age = '';
  String name = '';
  String email = '';
  String password = '';

  // --- STATE UI ---
  int _currentPage = 1;
  final int totalPages = 4;

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
      notifyListeners(); // Beri tahu UI bahwa ada perubahan state
    }
  }
}