import 'package:flutter/material.dart';

/// Centralized color palette following a modern, professional Purple-Violet Gradient Glass aesthetic.
abstract class AppColors {
  // Canvas & Deep Backgrounds
  static const Color bgDark = Color(0xFF0A0416);      // Deep Obsidian Purple Canvas
  static const Color bgSurface = Color(0xFF130927);   // Dark Plum Surface
  static const Color bgCard = Color(0xFF1A0D36);      // Deep Purple Glass Card Surface

  // Glassmorphism Fills & Borders
  static const Color glassBase = Color.fromRGBO(23, 10, 45, 0.70);
  static const Color glassCardFill = Color.fromRGBO(255, 255, 255, 0.04);
  static const Color glassBorder = Color.fromRGBO(255, 255, 255, 0.12);
  static const Color glassBorderHover = Color.fromRGBO(192, 132, 252, 0.5);

  // Professional Brand Accents & Glows
  static const Color accentIndigo = Color(0xFF7C3AED); // Electric Purple
  static const Color accentPurple = Color(0xFFA855F7); // Vibrant Magenta-Violet
  static const Color accentPink = Color(0xFFEC4899);   // Vibrant Pink Glow
  static const Color accentCyan = Color(0xFF38BDF8);   // Vibrant Sky Cyan
  static const Color accentBlue = Color(0xFF3B82F6);   // Deep Blue Glow
  static const Color accentEmerald = Color(0xFF10B981); // Success Emerald

  // Text Tokens
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color codeAccent = Color(0xFF38BDF8);

  // Signature Hero Gradient (Purple -> Violet -> Blue Glow)
  static const LinearGradient heroCardGradient = LinearGradient(
    colors: [
      Color(0xFF1A0736),
      Color(0xFF451065),
      Color(0xFF6B198F),
      Color(0xFF311A68),
      Color(0xFF1D3269),
    ],
    stops: [0.0, 0.35, 0.65, 0.85, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Toned-down, clean, professional button gradient (Rich Purple -> Soft Indigo)
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF6D28D9),
      Color(0xFF7C3AED),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Subhead Text Gradient (Cyan -> Pink)
  static const LinearGradient textGradient = LinearGradient(
    colors: [
      Color(0xFF38BDF8),
      Color(0xFFF472B6),
      Color(0xFFC084FC),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Sleek Glass Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accentCyan, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassFillGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.08),
      Color.fromRGBO(255, 255, 255, 0.02),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassBorderGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.20),
      Color.fromRGBO(255, 255, 255, 0.04),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

