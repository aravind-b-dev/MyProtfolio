import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../nav_controller.dart';

class MobileDrawer extends StatelessWidget {
  final NavController navController;
  final VoidCallback onClose;

  const MobileDrawer({
    super.key,
    required this.navController,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Background Backdrop Click to Dismiss
          GestureDetector(
            onTap: onClose,
            child: Container(
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),

          // Sliding Glass Panel
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: MediaQuery.of(context).size.width * 0.75,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  decoration: BoxDecoration(
                    color: AppColors.bgSurface.withValues(alpha: 0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                    border: Border.all(
                      color: AppColors.glassBorder,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header & Close Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NAVIGATION",
                            style: AppTypography.badgeTag(
                              color: AppColors.accentCyan,
                            ),
                          ),
                          IconButton(
                            onPressed: onClose,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: AppColors.textPrimary,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Navigation Options
                      ...['HOME', 'ABOUT', 'WORKS', 'SKILLS', 'CONTACT'].map((section) {
                        final isSelected = navController.activeSection == section;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: GestureDetector(
                            onTap: () {
                              onClose();
                              navController.scrollToSection(section);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    gradient: isSelected
                                        ? AppColors.primaryGradient
                                        : null,
                                    color: isSelected
                                        ? null
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  section,
                                  style: AppTypography.cardTitle(
                                    fontSize: 20,
                                    color: isSelected
                                        ? AppColors.accentCyan
                                        : AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      const Spacer(),

                      // Quick Subtitle & Copyright
                      Text(
                        AppStrings.developerTitle,
                        style: AppTypography.bodyStandard(fontSize: 13),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        AppStrings.copyright,
                        style: AppTypography.badgeTag(
                          fontSize: 10,
                          color: AppColors.textMuted,
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
