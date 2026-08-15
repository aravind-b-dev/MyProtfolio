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
        top: isMobile ? 110 : 150,
        bottom: 80,
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
        Expanded(flex: 6, child: _buildHeroContent(context)),
        const SizedBox(width: 40),
        // Right Column: Futuristic Developer Floating Glass Card
        const Expanded(flex: 5, child: Center(child: FloatingDevCard())),
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
        // Status Badge Row
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.glassBase,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.accentCyan.withValues(alpha: 0.3),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.accentCyan.withValues(alpha: 0.1),
                blurRadius: 12,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accentEmerald,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentEmerald,
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "${AppStrings.developerTitle.toUpperCase()} • ${AppStrings.yearsOfExperience}",
                style: AppTypography.badgeTag(
                  color: AppColors.accentCyan,
                  fontSize: 11.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Main Headline with Gradient
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
            AppStrings.headline,
            style: AppTypography.heroTitle(fontSize: isMobile ? 36 : 54),
          ),
        ),
        const SizedBox(height: 20),

        // Supporting Text
        Text(
          AppStrings.heroSubhead,
          style: AppTypography.bodyLarge(fontSize: isMobile ? 15 : 17.5),
        ),
        const SizedBox(height: 32),

        // Quick Highlights Chips
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            GlassChip(label: "SBI YONO Banking", color: AppColors.accentCyan),
            GlassChip(
              label: "MobX & BLoC Architecture",
              color: AppColors.accentPurple,
            ),
            GlassChip(label: "AI RAG Chatbots", color: AppColors.accentBlue),
            GlassChip(
              label: "Cross-Platform Web & Mobile",
              color: AppColors.accentEmerald,
            ),
          ],
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
