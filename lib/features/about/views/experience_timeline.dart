import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../data/models/experience_model.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;

  const ExperienceTimeline({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    if (isMobile) {
      return _buildVerticalTimeline(context);
    }
    return _buildHorizontalTimeline(context);
  }

  Widget _buildHorizontalTimeline(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: experiences.asMap().entries.map((entry) {
        final index = entry.key;
        final exp = entry.value;
        final isLast = index == experiences.length - 1;

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Year pill & node line
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      exp.year,
                      style: AppTypography.badgeTag(
                        color: Colors.black,
                        fontSize: 12,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.accentCyan,
                              AppColors.accentPurple.withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Experience Glass Card
              GlassContainer(
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.title,
                      style: AppTypography.cardTitle(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exp.company,
                      style: AppTypography.badgeTag(color: AppColors.accentCyan),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      exp.description,
                      style: AppTypography.bodyStandard(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    ...exp.highlights.map(
                      (h) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "• ",
                              style: TextStyle(color: AppColors.accentCyan),
                            ),
                            Expanded(
                              child: Text(
                                h,
                                style: AppTypography.bodyStandard(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildVerticalTimeline(BuildContext context) {
    return Column(
      children: experiences.map((exp) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Node dot & vertical line
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: AppColors.accentCyan,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentCyan,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 180,
                    color: AppColors.glassBorder,
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Content Card
              Expanded(
                child: GlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlassChip(
                        label: exp.year,
                        color: AppColors.accentCyan,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        exp.title,
                        style: AppTypography.cardTitle(fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exp.company,
                        style: AppTypography.badgeTag(color: AppColors.accentPurple),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        exp.description,
                        style: AppTypography.bodyStandard(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
