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
    final educationList = repository.getEducation();

    return Container(
      key: navController.sectionKeys['ABOUT'],
      padding: EdgeInsets.symmetric(
        vertical: 50,
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
                  label: "EXPERIENCE & BACKGROUND",
                  color: AppColors.accentPurple,
                ),
                const SizedBox(height: 10),
                Text(
                  "About Me & Enterprise Journey",
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 24 : 34,
                  ),
                ),
                const SizedBox(height: 24),

                // Bio Glass Hero Card
                GlassContainer(
                  padding: const EdgeInsets.all(24),
                  borderRadius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutIntro,
                        style: AppTypography.bodyLarge(
                          fontSize: isMobile ? 14.5 : 16.0,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Metric Cards Row
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildMetricCard("5.6+ Yrs", "Flutter Experience"),
                          _buildMetricCard("SBI YONO", "Enterprise Banking"),
                          _buildMetricCard("TCS", "Current Employer"),
                          _buildMetricCard("AI & RAG", "Gemini LLM Integration"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // TCS AI Hackathon Card
                GlassContainer(
                  padding: const EdgeInsets.all(20),
                  borderRadius: 16,
                  borderColor: AppColors.accentPurple.withValues(alpha: 0.3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.accentPurple.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.emoji_events_rounded,
                          color: AppColors.accentPurple,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TCS AI Hackathon Winner (Season 2) • SBI YONO 2.0 Team",
                              style: AppTypography.cardTitle(fontSize: 17),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Developed an AI-powered chatbot using Python and Gemini LLM for SBI YONO 2.0 with Retrieval-Augmented Generation (RAG) and enterprise PII data masking.",
                              style: AppTypography.bodyStandard(fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Experience Timeline
                Text(
                  "Work Experience Timeline",
                  style: AppTypography.cardTitle(fontSize: 22),
                ),
                const SizedBox(height: 16),
                ExperienceTimeline(experiences: experiences),
                const SizedBox(height: 40),

                // Education Section
                Text(
                  "Education & Qualifications",
                  style: AppTypography.cardTitle(fontSize: 22),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: educationList.map((edu) {
                    return SizedBox(
                      width: isMobile ? double.infinity : (isTablet ? 320 : 360),
                      child: GlassContainer(
                        padding: const EdgeInsets.all(18),
                        borderRadius: 14,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlassChip(
                              label: edu.period,
                              color: AppColors.accentIndigo,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              edu.degree,
                              style: AppTypography.cardTitle(fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              edu.institution,
                              style: AppTypography.bodyStandard(
                                fontSize: 13.5,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              edu.location,
                              style: AppTypography.badgeTag(
                                fontSize: 11,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: BorderRadius.circular(10),
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
              fontSize: 16,
              color: AppColors.accentPurple,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTypography.badgeTag(
              fontSize: 10.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
