import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTypography {
  // Main Sans-Serif Typography (Outfit / Inter style)
  static TextStyle heroTitle({double fontSize = 56, Color color = AppColors.textPrimary}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      height: 1.1,
      letterSpacing: -1.2,
      color: color,
    );
  }

  static TextStyle sectionTitle({double fontSize = 36, Color color = AppColors.textPrimary}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: -0.5,
      color: color,
    );
  }

  static TextStyle cardTitle({double fontSize = 22, Color color = AppColors.textPrimary}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: color,
    );
  }

  static TextStyle bodyLarge({double fontSize = 18, Color color = AppColors.textSecondary}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: color,
    );
  }

  static TextStyle bodyStandard({double fontSize = 15, Color color = AppColors.textSecondary}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle navLink({double fontSize = 14, Color color = AppColors.textSecondary, bool isSelected = false}) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      letterSpacing: 1.0,
      color: isSelected ? AppColors.accentCyan : color,
    );
  }

  // Developer Monospace Typography (JetBrains Mono style)
  static TextStyle codeSnippet({double fontSize = 14, Color color = AppColors.codeAccent}) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: color,
    );
  }

  static TextStyle badgeTag({double fontSize = 12, Color color = AppColors.accentCyan}) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      color: color,
    );
  }
}
