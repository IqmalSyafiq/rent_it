import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1822FF);
  static const Color primaryContainer = Color(0xFFFBFBFB);
  static const Color onPrimaryContainer = Color(0xFF0D47A1);
  static const Color secondary = Color(0xFF00BFA5);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE0F2F1);
  static const Color onSecondaryContainer = Color(0xFF00BFA5);
  static const Color tertiary = Color(0xFFC51162);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFCE4EC);
  static const Color onTertiaryContainer = Color(0xFFC51162);
  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFEBEE);
  static const Color onErrorContainer = Color(0xFFD32F2F);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF000000);
  static const Color surfaceContainerLow = Color(0xFFFAFAFA);
  static const Color onSurfaceVariant = Color(0xFF475569);
  static const Color outline = Color(0xFFF1F5F9);
  static const Color outlineVariant = Color(0xFF64748B);
  static const Color surfaceDim = Color(0x0F000000);
  static const Color scrim = Color(0x4D000000);
  static const Color inverseSurface = Color(0xFF000000);
  static const Color onInverseSurface = Color(0xFFFFFFFF);
  static const Color inversePrimary = Color(0xFFFFFFFF);
  static const Color surfaceTint = Color(0xFF828282);
}

class AppColorScheme {
  static const ColorScheme lightModeColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.primary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onInverseSurface,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onInverseSurface,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    error: AppColors.error,
    onError: AppColors.onInverseSurface,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    background: AppColors.surface,
    onBackground: AppColors.onSurface,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceVariant: AppColors.surfaceContainerLow,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    shadow: AppColors.surfaceDim,
    scrim: AppColors.scrim,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.onInverseSurface,
    inversePrimary: AppColors.inversePrimary,
    surfaceTint: AppColors.surfaceTint,
  );
}
