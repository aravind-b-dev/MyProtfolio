import 'package:flutter/material.dart';

/// Centralized color palette following futuristic dark glass aesthetic.
abstract class AppColors {
  // Canvas / Backgrounds
  static const Color bgDark = Color(0xFF080B10);
  static const Color bgSurface = Color(0xFF0E131F);
  static const Color bgCard = Color(0xFF131927);

  // Glass Surfaces
  static const Color glassBase = Color.fromRGBO(15, 23, 42, 0.65);
  static const Color glassBorder = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color glassBorderHover = Color.fromRGBO(0, 229, 255, 0.40);

  // Brand & Glow Accents
  static const Color accentCyan = Color(0xFF00E5FF);
  static const Color accentBlue = Color(0xFF2979FF);
  static const Color accentPurple = Color(0xFF7C4DFF);
  static const Color accentEmerald = Color(0xFF00E676);

  // Text Tokens
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color codeAccent = Color(0xFF38BDF8);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accentCyan, accentBlue, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.08),
      Color.fromRGBO(255, 255, 255, 0.02),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient borderGlowGradient = LinearGradient(
    colors: [
      Color.fromRGBO(0, 229, 255, 0.6),
      Color.fromRGBO(41, 121, 255, 0.4),
      Color.fromRGBO(124, 77, 255, 0.2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
