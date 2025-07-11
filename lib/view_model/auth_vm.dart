// lib/view_model/auth_vm.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthVM with ChangeNotifier {
  String? _token;
  DateTime? _tokenExpiryDate;

  bool get isLoggedIn => _token != null && _tokenExpiryDate?.isAfter(DateTime.now()) == true;

  Future<void> login(String token) async {
    final prefs = await SharedPreferences.getInstance();
    _token = token;
    _tokenExpiryDate = DateTime.now().add(Duration(days: 1)); // Token valid selama 1 hari
    await prefs.setString('token', token);
    await prefs.setString('expiryDate', _tokenExpiryDate!.toIso8601String());
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _token = null;
    _tokenExpiryDate = null;
    await prefs.remove('token');
    await prefs.remove('expiryDate');
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token') || !prefs.containsKey('expiryDate')) {
      return;
    }

    final token = prefs.getString('token')!;
    final expiryDate = DateTime.parse(prefs.getString('expiryDate')!);

    if (expiryDate.isBefore(DateTime.now())) {
      // Token sudah kadaluarsa
      await logout();
      return;
    }

    _token = token;
    _tokenExpiryDate = expiryDate;
    notifyListeners();
  }
}