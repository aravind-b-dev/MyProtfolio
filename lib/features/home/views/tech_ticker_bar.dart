import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/widgets/glass_chip.dart';

class TechTickerBar extends StatelessWidget {
  const TechTickerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final techStack = [
      "Flutter",
      "Dart",
      "MobX",
      "BLoC",
      "Provider",
      "Clean Architecture",
      "DigiLocker API",
      "SQLite",
      "REST APIs",
      "Firebase",
      "Gemini AI",
      "SwiftUI",
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.glassBase,
            gradient: AppColors.glassFillGradient,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.glassBorder,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.accentIndigo,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "FEATURED TECHNOLOGIES & ARCHITECTURE",
                    style: AppTypography.badgeTag(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: techStack.map((tech) {
                  return GlassChip(
                    label: tech,
                    color: AppColors.accentIndigo,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
