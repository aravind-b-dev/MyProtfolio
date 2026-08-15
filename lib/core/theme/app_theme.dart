import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

abstract class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentCyan,
        secondary: AppColors.accentBlue,
        tertiary: AppColors.accentPurple,
        surface: AppColors.bgSurface,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.heroTitle(),
        headlineMedium: AppTypography.sectionTitle(),
        titleMedium: AppTypography.cardTitle(),
        bodyLarge: AppTypography.bodyLarge(),
        bodyMedium: AppTypography.bodyStandard(),
      ),
    );
  }
}
