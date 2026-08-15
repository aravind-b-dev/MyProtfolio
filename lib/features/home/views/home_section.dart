import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_button.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../navigation/nav_controller.dart';
import 'floating_dev_card.dart';

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
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: EdgeInsets.only(
        top: isMobile ? 120 : 160,
        bottom: 80,
        left: isMobile ? 20 : (isTablet ? 40 : 80),
        right: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: ScrollReveal(
            keyName: 'home_section',
            child: ResponsiveLayout(
              mobile: _buildMobileLayout(context),
              desktop: _buildDesktopLayout(context),
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
        // Left Column: Hero Text & CTAs
        Expanded(
          flex: 6,
          child: _buildHeroContent(context),
        ),
        const SizedBox(width: 40),
        // Right Column: Futuristic Developer Floating Glass Card
        const Expanded(
          flex: 5,
          child: Center(child: FloatingDevCard()),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeroContent(context),
        const SizedBox(height: 50),
        const Center(child: FloatingDevCard()),
      ],
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tagline Badge
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.accentCyan,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            GlassChip(
              label: "${AppStrings.developerTitle.toUpperCase()} • ${AppStrings.yearsOfExperience}",
              color: AppColors.accentCyan,
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Main Headline
        Text(
          AppStrings.headline,
          style: AppTypography.heroTitle(
            fontSize: isMobile ? 36 : 56,
          ),
        ),
        const SizedBox(height: 20),

        // Supporting Text
        Text(
          AppStrings.heroSubhead,
          style: AppTypography.bodyLarge(
            fontSize: isMobile ? 15 : 18,
          ),
        ),
        const SizedBox(height: 36),

        // CTAs
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            GlassButton(
              text: AppStrings.viewMyWork,
              icon: Icons.arrow_downward_rounded,
              isPrimary: true,
              onPressed: () => navController.scrollToSection('WORKS'),
            ),
            GlassButton(
              text: AppStrings.letsConnect,
              icon: Icons.alternate_email_rounded,
              isPrimary: false,
              onPressed: () => navController.scrollToSection('CONTACT'),
            ),
          ],
        ),
      ],
    );
  }
}
