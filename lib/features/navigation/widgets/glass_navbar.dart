import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
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
    final isCompact = width < 850;

    return Positioned(
      top: 24,
      left: isCompact ? 16 : 40,
      right: isCompact ? 16 : 40,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.glassBase,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.glassBorderHover.withValues(alpha: 0.3),
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
                child: isCompact
                    ? _buildMobileHeader(context)
                    : _buildDesktopTabHeader(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => navController.scrollToSection('HOME'),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.flutter_dash_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Aravind B",
                style: AppTypography.cardTitle(fontSize: 16).copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onOpenMobileMenu,
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.textPrimary,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopTabHeader(BuildContext context) {
    return ListenableBuilder(
      listenable: navController,
      builder: (context, _) {
        final active = navController.activeSection;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left Nav Items
            _buildNavItem('HOME', 'HOME', active == 'HOME'),
            const SizedBox(width: 48),
            _buildNavItem('ABOUT', 'ABOUT', active == 'ABOUT'),

            const SizedBox(width: 40),

            // Center Signature Tab Notch Cutout (matching reference image)
            Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF090314),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                border: Border.all(
                  color: AppColors.glassBorder.withValues(alpha: 0.4),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentPurple.withValues(alpha: 0.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 36,
                  height: 3,
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonGradient,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 40),

            // Right Nav Items
            _buildNavItem('WORK', 'WORKS', active == 'WORKS'),
            const SizedBox(width: 48),
            _buildNavItem('CONTACT', 'CONTACT', active == 'CONTACT'),
          ],
        );
      },
    );
  }

  Widget _buildNavItem(String label, String sectionKey, bool isSelected) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => navController.scrollToSection(sectionKey),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.accentPurple.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13.5,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              letterSpacing: 1.2,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

