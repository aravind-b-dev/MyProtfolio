import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../data/models/skill_model.dart';

class SkillCategoryCard extends StatelessWidget {
  final SkillCategory category;

  const SkillCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(18),
      borderRadius: 14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header Icon & Name
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.accentPurple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.accentPurple.withValues(alpha: 0.3),
                  ),
                ),
                child: Center(
                  child: Icon(
                    category.icon,
                    color: AppColors.accentPurple,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  category.categoryName,
                  style: AppTypography.cardTitle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: AppColors.glassBorder),
          const SizedBox(height: 10),

          // Skill List Items with Badges
          ...category.skills.map((skill) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      skill.name,
                      style: AppTypography.bodyStandard(
                        fontSize: 13.5,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  GlassChip(
                    label: skill.level.label.toUpperCase(),
                    color: _getColorForLevel(skill.level),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _getColorForLevel(SkillLevel level) {
    switch (level) {
      case SkillLevel.expert:
        return AppColors.accentPurple;
      case SkillLevel.advanced:
        return AppColors.accentPink;
      case SkillLevel.strong:
        return AppColors.accentCyan;
      case SkillLevel.workingKnowledge:
        return AppColors.textMuted;
    }
  }
}
