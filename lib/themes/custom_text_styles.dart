import 'package:flutter/material.dart';
import 'package:program_arutala/themes/main_theme.dart'; // Ganti 'nama_proyek_anda' dengan nama proyek Anda

/// Berisi semua text style yang telah didefinisikan untuk aplikasi.
/// Dibuat berdasarkan skala tipografi (font size) dan ketebalan font (font weight).
class CustomTextStyles {
  CustomTextStyles._();

  // Thin - w100
  static final TextStyle thinXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w100);
  static final TextStyle thinSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w100);
  static final TextStyle thinBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w100);
  static final TextStyle thinLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w100);

  // Ultralight - w200
  static final TextStyle ultralightXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w200);
  static final TextStyle ultralightSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w200);
  static final TextStyle ultralightBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w200);
  static final TextStyle ultralightLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w200);

  // Light - w300
  static final TextStyle lightXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w300);
  static final TextStyle lightSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w300);
  static final TextStyle lightBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w300);
  static final TextStyle lightLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w300);
  static final TextStyle lightXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w300);
  static final TextStyle light2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w300);
  static final TextStyle light3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w300);
  static final TextStyle light4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w300);

  // Regular - w400
  static final TextStyle regularXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  static final TextStyle regularSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final TextStyle regularBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
  static final TextStyle regularLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400);
  static final TextStyle regularXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w400);
  static final TextStyle regular2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400);
  static final TextStyle regular3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w400);
  static final TextStyle regular4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400);

  // Medium - w500
  static final TextStyle mediumXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
  static final TextStyle mediumSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  static final TextStyle mediumBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
  static final TextStyle mediumLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500);
  static final TextStyle mediumXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w500);
  static final TextStyle medium2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w500);
  static final TextStyle medium3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w500);
  static final TextStyle medium4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w500);

  // Semibold - w600
  static final TextStyle semiboldXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static final TextStyle semiboldSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static final TextStyle semiboldBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  static final TextStyle semiboldLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600);
  static final TextStyle semiboldXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static final TextStyle semibold2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static final TextStyle semibold3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w600);
  static final TextStyle semibold4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w600);

  // Bold - w700
  static final TextStyle boldXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w700);
  static final TextStyle boldSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
  static final TextStyle boldBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700);
  static final TextStyle boldLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  static final TextStyle boldXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700);
  static final TextStyle bold2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w700);
  static final TextStyle bold3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w700);
  static final TextStyle bold4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w700);

  // Heavy - w800
  static final TextStyle heavyXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w800);
  static final TextStyle heavySm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w800);
  static final TextStyle heavyBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w800);
  static final TextStyle heavyLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w800);
  static final TextStyle heavyXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w800);
  static final TextStyle heavy2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w800);
  static final TextStyle heavy3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w800);
  static final TextStyle heavy4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w800);

  // Black - w900
  static final TextStyle blackXs = AppTheme.defaultTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w900);
  static final TextStyle blackSm = AppTheme.defaultTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w900);
  static final TextStyle blackBase = AppTheme.defaultTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w900);
  static final TextStyle blackLg = AppTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w900);
  static final TextStyle blackXl = AppTheme.defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w900);
  static final TextStyle black2xl = AppTheme.defaultTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w900);
  static final TextStyle black3xl = AppTheme.defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.w900);
  static final TextStyle black4xl = AppTheme.defaultTextStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w900);
  static final TextStyle black5xl = AppTheme.defaultTextStyle.copyWith(fontSize: 48, fontWeight: FontWeight.w900);
  static final TextStyle black6xl = AppTheme.defaultTextStyle.copyWith(fontSize: 60, fontWeight: FontWeight.w900);
  static final TextStyle black7xl = AppTheme.defaultTextStyle.copyWith(fontSize: 72, fontWeight: FontWeight.w900);
}