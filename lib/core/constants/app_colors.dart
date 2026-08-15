import 'package:flutter/material.dart';

/// Centralized color palette following a modern, professional Dark Glassmorphism aesthetic.
abstract class AppColors {
  // Canvas & Deep Backgrounds
  static const Color bgDark = Color(0xFF080C14);      // Deep Obsidian Navy
  static const Color bgSurface = Color(0xFF0F172A);   // Dark Slate Surface
  static const Color bgCard = Color(0xFF131C2E);      // Deep Card Surface

  // Glassmorphism Fills & Borders
  static const Color glassBase = Color.fromRGBO(15, 23, 42, 0.65);
  static const Color glassCardFill = Color.fromRGBO(255, 255, 255, 0.035);
  static const Color glassBorder = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color glassBorderHover = Color.fromRGBO(99, 102, 241, 0.5);

  // Professional Brand Accents & Glows
  static const Color accentIndigo = Color(0xFF6366F1); // Primary Electric Indigo
  static const Color accentCyan = Color(0xFF00F2FE);   // Vibrant Cyan
  static const Color accentBlue = Color(0xFF3B82F6);   // Professional Blue
  static const Color accentPurple = Color(0xFF818CF8); // Soft Violet Accent
  static const Color accentEmerald = Color(0xFF10B981); // Success Emerald

  // Text Tokens
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color codeAccent = Color(0xFF38BDF8);

  // Sleek Glass Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accentIndigo, accentCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassFillGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.06),
      Color.fromRGBO(255, 255, 255, 0.015),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassBorderGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.15),
      Color.fromRGBO(255, 255, 255, 0.03),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
