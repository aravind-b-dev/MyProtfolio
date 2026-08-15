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
import 'project_card.dart';

class WorksSection extends StatelessWidget {
  final NavController navController;
  final PortfolioRepository repository;

  const WorksSection({
    super.key,
    required this.navController,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final projects = repository.getProjects();

    return Container(
      key: navController.sectionKeys['WORKS'],
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: ScrollReveal(
            keyName: 'works_section',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                const GlassChip(
                  label: "FEATURED PROJECTS",
                  color: AppColors.accentIndigo,
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.worksTitle,
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 24 : 34,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.worksSubtitle,
                  style: AppTypography.bodyLarge(
                    fontSize: isMobile ? 14.5 : 16.0,
                  ),
                ),
                const SizedBox(height: 30),

                // Responsive Grid Layout
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: isMobile ? 1.05 : 0.95,
                  ),
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
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
