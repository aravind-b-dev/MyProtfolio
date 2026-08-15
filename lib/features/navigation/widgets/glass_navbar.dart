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
      top: 16,
      left: isCompact ? 16 : 40,
      right: isCompact ? 16 : 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.bgSurface.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.glassBorder,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
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
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.accentIndigo,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.flutter_dash_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.developerName,
                              style: AppTypography.cardTitle(fontSize: 16),
                            ),
                            Text(
                              AppStrings.developerTitle,
                              style: AppTypography.badgeTag(
                                fontSize: 9.5,
                                color: AppColors.accentIndigo,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Navigation Links
                if (isCompact)
                  IconButton(
                    onPressed: onOpenMobileMenu,
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: AppColors.textPrimary,
                      size: 24,
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
                            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                        color: isSelected
                                            ? AppColors.accentIndigo
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      height: 2,
                                      width: isSelected ? 16 : 0,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentIndigo,
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
