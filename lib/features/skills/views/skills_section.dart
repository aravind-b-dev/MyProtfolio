import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../navigation/nav_controller.dart';
import 'skill_category_card.dart';

class SkillsSection extends StatelessWidget {
  final NavController navController;
  final PortfolioRepository repository;

  const SkillsSection({
    super.key,
    required this.navController,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final skillCategories = repository.getSkillCategories();

    return Container(
      key: navController.sectionKeys['SKILLS'],
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: ScrollReveal(
            keyName: 'skills_section',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                const GlassChip(
                  label: "TECHNICAL SKILLS",
                  color: AppColors.accentPurple,
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.skillsTitle,
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 24 : 34,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.skillsSubtitle,
                  style: AppTypography.bodyLarge(
                    fontSize: isMobile ? 14.5 : 16.0,
                  ),
                ),
                const SizedBox(height: 30),

                // Skill Cards Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: skillCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isMobile ? 1.05 : 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return SkillCategoryCard(category: skillCategories[index]);
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
