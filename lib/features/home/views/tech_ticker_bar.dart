import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';

class TechTickerBar extends StatelessWidget {
  const TechTickerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final techStack = [
      "FLUTTER",
      "DART",
      "MOBX",
      "BLOC",
      "PROVIDER",
      "CLEAN ARCHITECTURE",
      "DIGILOCKER API",
      "SQLITE",
      "REST APIS",
      "FIREBASE",
      "GEMINI LLM AI",
      "SWIFTUI",
      "UNIT & WIDGET TESTING",
      "CI/CD",
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.glassBase,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.glassBorder,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
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
                  color: Color(0xFFFF5252),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "FEATURED TECH STACK & ARCHITECTURE",
                style: AppTypography.badgeTag(
                  color: AppColors.textMuted,
                  fontSize: 10.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: techStack.map((tech) {
                return Padding(
                  padding: const EdgeInsets.only(right: 28.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tech,
                        style: AppTypography.codeSnippet(
                          fontSize: 13.5,
                          color: AppColors.textSecondary,
                        ).copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(width: 28),
                      Text(
                        "•",
                        style: TextStyle(
                          color: const Color(0xFFFF5252).withValues(alpha: 0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
