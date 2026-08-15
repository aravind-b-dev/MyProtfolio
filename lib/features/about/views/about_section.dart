import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../navigation/nav_controller.dart';
import 'experience_timeline.dart';

class AboutSection extends StatelessWidget {
  final NavController navController;
  final PortfolioRepository repository;

  const AboutSection({
    super.key,
    required this.navController,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final experiences = repository.getExperiences();

    return Container(
      key: navController.sectionKeys['ABOUT'],
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: ScrollReveal(
            keyName: 'about_section',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                const GlassChip(
                  label: "BACKGROUND & EXPERIENCE",
                  color: AppColors.accentCyan,
                ),
                const SizedBox(height: 12),
                Text(
                  AppStrings.aboutTitle,
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 28 : 40,
                  ),
                ),
                const SizedBox(height: 24),

                // Intro Glass Card
                GlassContainer(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutIntro,
                        style: AppTypography.bodyLarge(
                          fontSize: isMobile ? 15 : 17,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Metric Cards Grid
                      Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        children: [
                          _buildMetricCard("5.6+ YRS", "Flutter Experience"),
                          _buildMetricCard("10+ APPS", "Production Workflows"),
                          _buildMetricCard("99.9%", "Uptime & Stability"),
                          _buildMetricCard("100%", "Clean Architecture"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Experience Timeline Subtitle
                Text(
                  "Career Milestone Timeline",
                  style: AppTypography.cardTitle(fontSize: 24),
                ),
                const SizedBox(height: 20),

                // Responsive Experience Timeline
                ExperienceTimeline(experiences: experiences),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.glassBase,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.glassBorder,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: AppTypography.cardTitle(
              fontSize: 22,
              color: AppColors.accentCyan,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTypography.badgeTag(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
