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
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentIndigo,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      exp.year,
                      style: AppTypography.badgeTag(
                        color: Colors.white,
                        fontSize: 11,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: AppColors.glassBorder,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Experience Card
              GlassContainer(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(16),
                borderRadius: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.title,
                      style: AppTypography.cardTitle(fontSize: 16),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      exp.company,
                      style: AppTypography.badgeTag(color: AppColors.accentIndigo, fontSize: 11.5),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      exp.description,
                      style: AppTypography.bodyStandard(fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    ...exp.highlights.map(
                      (h) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "• ",
                              style: TextStyle(color: AppColors.accentIndigo),
                            ),
                            Expanded(
                              child: Text(
                                h,
                                style: AppTypography.bodyStandard(
                                  fontSize: 12.5,
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
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Node dot & vertical line
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: AppColors.accentIndigo,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 140,
                    color: AppColors.glassBorder,
                  ),
                ],
              ),
              const SizedBox(width: 14),

              // Content Card
              Expanded(
                child: GlassContainer(
                  padding: const EdgeInsets.all(16),
                  borderRadius: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlassChip(
                        label: exp.year,
                        color: AppColors.accentIndigo,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        exp.title,
                        style: AppTypography.cardTitle(fontSize: 16),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        exp.company,
                        style: AppTypography.badgeTag(color: AppColors.accentIndigo, fontSize: 11.5),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        exp.description,
                        style: AppTypography.bodyStandard(fontSize: 13),
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
