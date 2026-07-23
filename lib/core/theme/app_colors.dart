import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // ===== Brand =====
  static const primary = Color(0xFF22C55E);
  static const primaryDark = Color(0xFF16A34A);
  static const primaryLight = Color(0xFF4ADE80);

  // ===== Light Theme =====
  static const backgroundLight = Color(0xFFFFFFFF);
  static const surfaceLight = Color(0xFFF8FAFC);
  static const cardLight = Colors.white;
  static const dialogLight = Colors.white;
  static const bottomSheetLight = Colors.white;

  // ===== Dark Theme =====
  static const backgroundDark = Color(0xFF0F172A);
  static const surfaceDark = Color(0xFF1E293B);
  static const cardDark = Color(0xFF273549);
  static const dialogDark = Color(0xFF273549);
  static const bottomSheetDark = Color(0xFF273549);

  // ===== Text =====
  static const textPrimaryLight = Color(0xFF111827);
  static const textSecondaryLight = Color(0xFF6B7280);
  static const textHintLight = Color(0xFF9CA3AF);

  static const textPrimaryDark = Colors.white;
  static const textSecondaryDark = Color(0xFFCBD5E1);
  static const textHintDark = Color(0xFF94A3B8);

  // ===== Borders =====
  static const borderLight = Color(0xFFE5E7EB);
  static const dividerLight = Color(0xFFF1F5F9);

  static const borderDark = Color(0xFF334155);
  static const dividerDark = Color(0xFF334155);

  // ===== Icons =====
  static const iconLight = Color(0xFF374151);
  static const iconDark = Colors.white70;

  // ===== Buttons =====
  static const buttonPrimary = primary;
  static const buttonSecondary = Color(0xFFE5E7EB);
  static const buttonDisabled = Color(0xFFD1D5DB);

  // ===== Input =====
  static const inputFillLight = Color(0xFFF8FAFC);
  static const inputFillDark = Color(0xFF334155);

  // ===== Status =====
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  // ===== Bluetooth =====
  static const connected = Color(0xFF22C55E);
  static const disconnected = Color(0xFFEF4444);
  static const scanning = Color(0xFF3B82F6);

  // ===== Switch =====
  static const switchTrackActive = primary;
  static const switchTrackInactiveLight = Color(0xFFD1D5DB);
  static const switchTrackInactiveDark = Color(0xFF475569);
  static const switchThumb = Colors.white;

  // ===== Slider =====
  static const sliderInactiveLight = Color(0xFFE5E7EB);
  static const sliderInactiveDark = Color(0xFF475569);
  static const sliderOverlay = Color(0x3322C55E);

  // ===== Alarm =====
  static const alarm = Color(0xFFDC2626);

  // ===== Navigation =====
  static const navigationSelected = primaryDark;
  static const navigationUnselectedLight = Color(0xFF6B7280);
  static const navigationUnselectedDark = Color(0xFFCBD5E1);
  static const navigationIndicator = Color(0x3322C55E);
}
