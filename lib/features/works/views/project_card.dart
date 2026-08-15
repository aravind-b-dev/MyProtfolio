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
              // Header Badge & Enterprise Tag
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlassChip(
                    label: project.isEnterprise ? "ENTERPRISE" : "OPEN SOURCE",
                    color: project.isEnterprise
                        ? AppColors.accentCyan
                        : AppColors.accentPurple,
                  ),
                  const Icon(
                    Icons.north_east_rounded,
                    color: AppColors.accentCyan,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Title & Subtitle
              Text(
                project.title,
                style: AppTypography.cardTitle(fontSize: 22),
              ),
              const SizedBox(height: 6),
              Text(
                project.subtitle,
                style: AppTypography.badgeTag(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 14),

              // Description
              Text(
                project.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodyStandard(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Bottom Tech Stack Chips
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(color: AppColors.glassBorder),
              const SizedBox(height: 10),
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
