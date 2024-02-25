import 'package:flutter/material.dart';

TextStyle baseTextStyle({double? size, FontWeight? weight, double? letterSpacing, double? height}) => TextStyle(
      fontSize: size ?? 14,
      fontFamily: 'Inter',
      fontWeight: weight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0.1,
      height: height,
    );

class AppTextStyles {
  /// < -----    DISPLAY    ----->
  static TextStyle displayLarge = baseTextStyle(size: 57, letterSpacing: -0.25, height: 1.12);

  static TextStyle displayMedium = baseTextStyle(size: 45, letterSpacing: 0, height: 1.15);

  static TextStyle displaySmall = baseTextStyle(size: 36, letterSpacing: 0, height: 1.2);

  /// < -----    HEADLINE    ----->
  static TextStyle headlineLarge = baseTextStyle(size: 32, letterSpacing: 0, height: 1.25);

  static TextStyle headlineMedium = baseTextStyle(size: 28, letterSpacing: 0, height: 1.28);

  static TextStyle headlineSmall = baseTextStyle(size: 24, letterSpacing: 0, height: 1.3);

  /// < -----    TITLE    ----->
  static TextStyle titleLarge = baseTextStyle(size: 22, letterSpacing: 0, height: 1.27);

  static TextStyle titleMedium = baseTextStyle(size: 16, letterSpacing: 0.15, height: 1.5);

  static TextStyle titleSmall = baseTextStyle(size: 14, letterSpacing: 0.1, height: 1.4);

  /// < -----    LABEL    ----->
  static TextStyle labelLarge = baseTextStyle(size: 14, letterSpacing: 0.1, height: 1.4);

  static TextStyle labelMedium = baseTextStyle(size: 12, letterSpacing: 0.2, height: 1.3);

  static TextStyle labelSmall = baseTextStyle(size: 11, letterSpacing: 0.2, height: 1.45);

  /// < -----    BODY    ----->
  static TextStyle bodyLarge = baseTextStyle(size: 16, letterSpacing: 0, height: 1.5);

  static TextStyle bodyMedium = baseTextStyle(size: 14, letterSpacing: 0, height: 1.42);

  static TextStyle bodySmall = baseTextStyle(size: 12, letterSpacing: 0, height: 1.3);
  ////
}
