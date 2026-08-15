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
    final frameSize = isSmall ? 280.0 : 360.0;
    final imageSize = isSmall ? 240.0 : 310.0;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Ambient Radial Light Glow Behind Profile
          Container(
            width: frameSize + 40,
            height: frameSize + 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentIndigo.withValues(alpha: 0.25),
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: AppColors.accentCyan.withValues(alpha: 0.15),
                  blurRadius: 60,
                  spreadRadius: 15,
                ),
              ],
            ),
          ),

          // Outer Frosted Glass Outer Container (Layer 1)
          ClipRRect(
            borderRadius: BorderRadius.circular(frameSize / 2),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                width: frameSize,
                height: frameSize,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.glassBase,
                  gradient: AppColors.glassFillGradient,
                  border: Border.all(
                    color: AppColors.glassBorderHover,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.primaryGradient,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.bgSurface,
                        child: const Icon(
                          Icons.person_rounded,
                          size: 90,
                          color: AppColors.accentIndigo,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Layer 2: Glass Experience Pill Badge Floating at Bottom
          Positioned(
            bottom: -15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.bgSurface.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.glassBorderHover,
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentIndigo.withValues(alpha: 0.3),
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
