import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PersonalizationService {
  static const _pendingKey = 'pending_personalization';

  Future<bool> saveOrQueue({
    required String? educationLevel,
    required String? informationSource,
    required String? learningFocus,
  }) async {
    final client = Supabase.instance.client;
    final uid = client.auth.currentUser?.id;

    // Normalize empty values to null/empty string as needed
    final data = <String, dynamic>{
      'education_level': educationLevel,
      'information_source': informationSource,
      'learning_focus': learningFocus,
    };

    if (uid != null) {
      await client.from('personalizations').upsert({
        'user_id': uid,
        ...data,
        'updated_at': DateTime.now().toIso8601String(),
      });
      return true; // saved to server
    }

    // Queue locally if not logged in yet
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pendingKey, jsonEncode(data));
    return false; // queued
  }

  Future<bool> flushIfAny() async {
    final client = Supabase.instance.client;
    final uid = client.auth.currentUser?.id;
    if (uid == null) return false;

    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_pendingKey);
    if (jsonStr == null) return false;

    final Map<String, dynamic> data = jsonDecode(jsonStr);
    await client.from('personalizations').upsert({
      'user_id': uid,
      ...data,
      'updated_at': DateTime.now().toIso8601String(),
    });

    await prefs.remove(_pendingKey);
    return true;
  }
}
