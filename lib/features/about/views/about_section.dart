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
                  label: "BACKGROUND & ENTERPRISE EXPERIENCE",
                  color: AppColors.accentCyan,
                ),
                const SizedBox(height: 12),
                Text(
                  AppStrings.aboutTitle,
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 28 : 40,
                  ),
                ),
                const SizedBox(height: 30),

                // Featured Profile & Bio Glass Hero Grid
                ResponsiveLayout(
                  mobile: Column(
                    children: [
                      _buildProfileCard(context),
                      const SizedBox(height: 24),
                      _buildBioCard(context, isMobile),
                    ],
                  ),
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: _buildProfileCard(context),
                      ),
                      const SizedBox(width: 28),
                      Expanded(
                        flex: 7,
                        child: _buildBioCard(context, isMobile),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // TCS AI Hackathon Achievement Card
                GlassContainer(
                  padding: const EdgeInsets.all(28),
                  borderColor: AppColors.accentPurple,
                  hoverBorderColor: AppColors.accentCyan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.accentPurple.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.accentPurple.withValues(alpha: 0.4),
                              ),
                            ),
                            child: const Icon(
                              Icons.emoji_events_rounded,
                              color: AppColors.accentPurple,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TCS AI Hackathon Participant & Innovator",
                                  style: AppTypography.cardTitle(fontSize: 20),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "AI Friday Season 2 • SBI YONO 2.0 Team",
                                  style: AppTypography.badgeTag(
                                    color: AppColors.accentPurple,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Developed an AI-powered chatbot using Python and Gemini LLM for SBI YONO 2.0. Implemented Retrieval-Augmented Generation (RAG) to eliminate hallucinations, ensuring enterprise security by masking PII and sensitive user data.",
                        style: AppTypography.bodyStandard(fontSize: 14.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),

                // Experience Timeline Subtitle
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Work Experience Timeline",
                      style: AppTypography.cardTitle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Responsive Experience Timeline
                ExperienceTimeline(experiences: experiences),
                const SizedBox(height: 60),

                // Education Section
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Education & Credentials",
                      style: AppTypography.cardTitle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: educationList.map((edu) {
                    return SizedBox(
                      width: isMobile ? double.infinity : (isTablet ? 340 : 380),
                      child: GlassContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlassChip(
                              label: edu.period,
                              color: AppColors.accentCyan,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              edu.degree,
                              style: AppTypography.cardTitle(fontSize: 17),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              edu.institution,
                              style: AppTypography.bodyStandard(
                                fontSize: 14,
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

  Widget _buildProfileCard(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      borderRadius: 24,
      borderColor: AppColors.glassBorderHover,
      child: Column(
        children: [
          // Profile Avatar with Gradient Glow Frame
          Container(
            width: 160,
            height: 160,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentCyan.withValues(alpha: 0.35),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                width: 152,
                height: 152,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.bgSurface,
                  child: const Icon(
                    Icons.person_rounded,
                    size: 64,
                    color: AppColors.accentCyan,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            AppStrings.developerName,
            style: AppTypography.cardTitle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.developerTitle,
            style: AppTypography.badgeTag(
              color: AppColors.accentCyan,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.glassBorder),
          const SizedBox(height: 16),

          // Key Highlights
          _buildInfoRow(Icons.business_center_rounded, "TCS (SBI YONO Team)"),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.stars_rounded, "5.6+ Years Flutter Experience"),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.verified_user_rounded, "Enterprise Banking Architect"),
          const SizedBox(height: 10),
          _buildInfoRow(Icons.location_on_rounded, AppStrings.location),
        ],
      ),
    );
  }

  Widget _buildBioCard(BuildContext context, bool isMobile) {
    return GlassContainer(
      padding: const EdgeInsets.all(28),
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Architecting Next-Gen Enterprise Platforms",
            style: AppTypography.cardTitle(fontSize: 22),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.aboutIntro,
            style: AppTypography.bodyLarge(
              fontSize: isMobile ? 14.5 : 16.5,
            ),
          ),
          const SizedBox(height: 28),

          // Metric Cards Grid
          Wrap(
            spacing: 16,
            runSpacing: 14,
            children: [
              _buildMetricCard("5.6+ Yrs", "Flutter Experience"),
              _buildMetricCard("Millions", "SBI YONO Users"),
              _buildMetricCard("MobX & BLoC", "State Architect"),
              _buildMetricCard("AI & RAG", "Gemini LLM Lead"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accentCyan, size: 16),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodyStandard(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.glassBase,
        borderRadius: BorderRadius.circular(12),
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
              fontSize: 18,
              color: AppColors.accentCyan,
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
