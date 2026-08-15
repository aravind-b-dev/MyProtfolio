import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../nav_controller.dart';

class GlassNavbar extends StatelessWidget {
  final NavController navController;
  final VoidCallback onOpenMobileMenu;

  const GlassNavbar({
    super.key,
    required this.navController,
    required this.onOpenMobileMenu,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isCompact = width < 900;

    return Positioned(
      top: 20,
      left: isCompact ? 16 : 40,
      right: isCompact ? 16 : 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Brand / Developer Logo
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => navController.scrollToSection('HOME'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentCyan.withValues(alpha: 0.4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.code_rounded,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.developerName,
                              style: AppTypography.cardTitle(fontSize: 18),
                            ),
                            Text(
                              AppStrings.developerTitle,
                              style: AppTypography.badgeTag(
                                fontSize: 10,
                                color: AppColors.accentCyan,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Compact Menu Button or Full Navigation Bar
                if (isCompact)
                  IconButton(
                    onPressed: onOpenMobileMenu,
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: AppColors.accentCyan,
                      size: 28,
                    ),
                  )
                else
                  ListenableBuilder(
                    listenable: navController,
                    builder: (context, _) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          'HOME',
                          'ABOUT',
                          'WORKS',
                          'SKILLS',
                          'CONTACT',
                        ].map((section) {
                          final isSelected =
                              navController.activeSection == section;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => navController.scrollToSection(section),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      section,
                                      style: AppTypography.navLink(
                                        isSelected: isSelected,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      curve: Curves.easeOut,
                                      height: 2,
                                      width: isSelected ? 20 : 0,
                                      decoration: BoxDecoration(
                                        gradient: AppColors.primaryGradient,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
