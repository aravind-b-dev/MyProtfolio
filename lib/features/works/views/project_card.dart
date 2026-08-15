import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../data/models/project_model.dart';
import 'project_detail_dialog.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(20),
      borderRadius: 14,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ProjectDetailDialog(project: project),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Tag
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlassChip(
                    label: project.isEnterprise ? "ENTERPRISE" : "FEATURED PROJECT",
                    color: project.isEnterprise
                        ? AppColors.accentPurple
                        : AppColors.accentCyan,
                  ),
                  const Icon(
                    Icons.north_east_rounded,
                    color: AppColors.textMuted,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Title & Subtitle
              Text(
                project.title,
                style: AppTypography.cardTitle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                project.subtitle,
                style: AppTypography.badgeTag(
                  color: AppColors.textMuted,
                  fontSize: 11.5,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                project.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodyStandard(fontSize: 13.5),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Bottom Tech Tags
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(color: AppColors.glassBorder),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: project.technologies
                    .take(4)
                    .map((tech) => GlassChip(label: tech))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
