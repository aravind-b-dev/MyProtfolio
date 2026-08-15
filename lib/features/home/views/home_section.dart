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
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: EdgeInsets.only(
        top: isMobile ? 100 : 140,
        bottom: 60,
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
                const SizedBox(height: 60),
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
        // Left Column: Greeting, Name, Role & Action Buttons
        Expanded(
          flex: 6,
          child: _buildHeroContent(context),
        ),
        const SizedBox(width: 40),
        // Right Column: Profile Picture Ring Frame (Reference style)
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
        const SizedBox(height: 50),
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
        // Top Greeting (Reference image style: Hello .)
        Row(
          children: [
            Text(
              "Hello",
              style: AppTypography.heroTitle(
                fontSize: isMobile ? 32 : 44,
              ).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFFFF5252),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFF5252),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Accent Line + Name Tag (Reference image style: —— I'm Jensen)
        Row(
          children: [
            Container(
              width: 40,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFFF5252),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "I'm ${AppStrings.developerName}",
              style: AppTypography.sectionTitle(
                fontSize: isMobile ? 22 : 30,
                color: AppColors.textSecondary,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Headline / Large Role Title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              AppColors.textPrimary,
              AppColors.textPrimary,
              AppColors.accentCyan,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            "Senior Flutter\nDeveloper",
            style: AppTypography.heroTitle(
              fontSize: isMobile ? 40 : 64,
            ).copyWith(height: 1.05),
          ),
        ),
        const SizedBox(height: 20),

        // Subtitle / Bio summary
        Text(
          AppStrings.heroSubhead,
          style: AppTypography.bodyLarge(
            fontSize: isMobile ? 15 : 17.5,
          ),
        ),
        const SizedBox(height: 28),

        // Quick Highlights Chips
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            GlassChip(label: "SBI YONO Banking", color: Color(0xFFFF5252)),
            GlassChip(label: "MobX & BLoC", color: AppColors.accentCyan),
            GlassChip(label: "AI RAG Chatbots", color: AppColors.accentPurple),
            GlassChip(label: "Clean Architecture", color: AppColors.accentEmerald),
          ],
        ),
        const SizedBox(height: 36),

        // Action CTAs (Reference image style: "Got a project?" solid button + "Explore Work" outline button)
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: () => navController.scrollToSection('CONTACT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5252),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: const Color(0xFFFF5252).withValues(alpha: 0.5),
              ),
              icon: const Icon(Icons.rocket_launch_rounded, size: 20),
              label: Text(
                "Got a project?",
                style: AppTypography.badgeTag(
                  color: Colors.white,
                  fontSize: 14,
                ).copyWith(fontWeight: FontWeight.w700),
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
