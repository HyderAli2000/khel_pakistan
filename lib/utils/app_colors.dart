import 'package:flutter/material.dart';

/// Design tokens for the light "Khail Pakistan" theme.
///
/// Use the semantic names (by purpose) in new code. Only [primary] is an exact
/// value from Figma; the rest are taken from the design screenshots and
/// should be checked against Figma's Inspect panel.
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFFD5FE21); // lime
  static const Color primaryDark = Color(0xFFBFE80C); // gradient end, shading
  static const Color onPrimary = Color(0xFF111111); // text/icons on lime

  // Surfaces
  static const Color background = Color(0xFFF3F2EE); // cream scaffold
  static const Color surface = Color(0xFFFFFFFF); // cards, search bar
  static const Color inputFill = Color(0xFFDCDBD6); // grey pill fields, chips
  static const Color card = Color(0xFFE6E5E0); // sport category tiles
  static const Color border = Color(0xFFC9C8C3);
  static const Color divider = Color(0xFFDDDCD7);

  // Splash gradient (lime-tinted top → peach bottom)
  static const Color splashTop = Color(0xFFF0F6D4);
  static const Color splashBottom = Color(0xFFF9E7DB);

  // Dark elements (back/close buttons, bottom nav, Apple button)
  static const Color dark = Color(0xFF1E1E1E);
  static const Color onDark = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF5F5F5F);
  static const Color textHint = Color(0xFF8A8A8A);
  static const Color label = Color(0xFF8C95A3); // field labels, step caption

  // Status / accents
  static const Color danger = Color(0xFFFF3922); // Google button, errors
  static const Color dangerLight = Color(0xFFFE6857);
  static const Color success = Color(0xFF2EAD5B);
  static const Color star = Color(0xFFFFB800); // rating stars

  static const Color white = Color(0xFFFFFFFF);
}
