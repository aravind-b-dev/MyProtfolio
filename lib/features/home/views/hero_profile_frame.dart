import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';

class HeroProfileFrame extends StatelessWidget {
  const HeroProfileFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 600;
    final frameWidth = isSmall ? 260.0 : 350.0;
    final frameHeight = isSmall ? 310.0 : 420.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Glowing Backdrop Lighting behind Portrait
          Positioned(
            child: Container(
              width: frameWidth * 0.9,
              height: frameHeight * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(frameWidth / 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentPurple.withValues(alpha: 0.35),
                    blurRadius: 70,
                    spreadRadius: 20,
                  ),
                  BoxShadow(
                    color: AppColors.accentCyan.withValues(alpha: 0.25),
                    blurRadius: 60,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),

          // Profile Image Frame
          Container(
            width: frameWidth,
            height: frameHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  AppColors.accentPurple.withValues(alpha: 0.3),
                  AppColors.accentCyan.withValues(alpha: 0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  // Subtle inner radial glow
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            AppColors.accentPurple.withValues(alpha: 0.15),
                            Colors.transparent,
                          ],
                          radius: 0.8,
                        ),
                      ),
                    ),
                  ),

                  // Main Profile Image
                  Center(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: frameWidth,
                      height: frameHeight,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.bgSurface,
                        child: const Icon(
                          Icons.person_rounded,
                          size: 100,
                          color: AppColors.accentPurple,
                        ),
                      ),
                    ),
                  ),

                  // Inner Subtle Border
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Experience Glass Pill floating overlay
          Positioned(
            bottom: -16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.bgDark.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.glassBorderHover,
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentPurple.withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.accentEmerald,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accentEmerald,
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${AppStrings.yearsOfExperience} EXP • TCS SBI YONO",
                        style: AppTypography.badgeTag(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
