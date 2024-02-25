import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_it/constant/app_colors.dart';
import 'package:rent_it/constant/app_text_styles.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Inter',
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: ThemeConfig().textTheme(),
      colorScheme: AppColorScheme.lightModeColorScheme,
      scaffoldBackgroundColor: AppColors.primaryContainer,
      appBarTheme: ThemeConfig().appBarTheme(),
    );
  }
}

class ThemeConfig {
  TextTheme textTheme() => TextTheme(
        ///display
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,

        ///headline
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,

        ///title
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,

        ///body
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,

        ///label
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      );

  AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: AppColors.primaryContainer,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
}
