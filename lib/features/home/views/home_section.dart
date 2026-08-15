import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_button.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../navigation/nav_controller.dart';
import 'hero_profile_frame.dart';
import 'tech_ticker_bar.dart';

class HomeSection extends StatelessWidget {
  final NavController navController;

  const HomeSection({super.key, required this.navController});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      key: navController.sectionKeys['HOME'],
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      padding: EdgeInsets.only(
        top: isMobile ? 80 : 120,
        bottom: 40,
        left: isMobile ? 20 : (isTablet ? 40 : 80),
        right: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.maxContentWidth,
          ),
          child: ScrollReveal(
            keyName: 'home_section',
            child: Column(
              children: [
                ResponsiveLayout(
                  mobile: _buildMobileLayout(context),
                  desktop: _buildDesktopLayout(context),
                ),
                const SizedBox(height: 40),
                const TechTickerBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Professional Intro Text & CTAs
        Expanded(
          flex: 6,
          child: _buildHeroContent(context),
        ),
        const SizedBox(width: 40),
        // Right Column: Clean Profile Avatar
        const Expanded(
          flex: 5,
          child: Center(child: HeroProfileFrame()),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: HeroProfileFrame()),
        const SizedBox(height: 32),
        _buildHeroContent(context),
      ],
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Role & Experience Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentIndigo.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentIndigo.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
          child: Text(
            "${AppStrings.developerTitle.toUpperCase()} • ${AppStrings.yearsOfExperience}",
            style: AppTypography.badgeTag(
              color: AppColors.accentIndigo,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Name Header
        Text(
          AppStrings.developerName,
          style: AppTypography.heroTitle(
            fontSize: isMobile ? 36 : 52,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),

        // Tagline / Headline
        Text(
          "Building Scalable Enterprise Mobile & Web Platforms",
          style: AppTypography.sectionTitle(
            fontSize: isMobile ? 20 : 26,
            color: AppColors.accentIndigo,
          ),
        ),
        const SizedBox(height: 16),

        // Concise Bio Summary
        Text(
          AppStrings.heroSubhead,
          style: AppTypography.bodyLarge(
            fontSize: isMobile ? 14.5 : 16.5,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 28),

        // Action CTAs
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => navController.scrollToSection('CONTACT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentIndigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: Text(
                "Get in Touch",
                style: AppTypography.badgeTag(
                  color: Colors.white,
                  fontSize: 13.5,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            GlassButton(
              text: AppStrings.viewMyWork,
              icon: Icons.arrow_downward_rounded,
              isPrimary: false,
              onPressed: () => navController.scrollToSection('WORKS'),
            ),
          ],
        ),
      ],
    );
  }
}
