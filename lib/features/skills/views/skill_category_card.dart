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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header Icon & Name
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.accentCyan.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.accentCyan.withValues(alpha: 0.3),
                  ),
                ),
                child: Center(
                  child: Icon(
                    category.icon,
                    color: AppColors.accentCyan,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  category.categoryName,
                  style: AppTypography.cardTitle(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.glassBorder),
          const SizedBox(height: 14),

          // Skill List Items with Badges
          ...category.skills.map((skill) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      skill.name,
                      style: AppTypography.bodyStandard(
                        fontSize: 14,
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
        return AppColors.accentCyan;
      case SkillLevel.advanced:
        return AppColors.accentBlue;
      case SkillLevel.strong:
        return AppColors.accentPurple;
      case SkillLevel.workingKnowledge:
        return AppColors.textSecondary;
    }
  }
}
