import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/widgets/glass_button.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../data/models/project_model.dart';

class ProjectDetailDialog extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: GlassContainer(
              padding: const EdgeInsets.all(32),
              borderRadius: 24,
              borderColor: AppColors.glassBorderHover,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header & Close Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GlassChip(
                          label: project.isEnterprise ? "ENTERPRISE PRODUCTION" : "OPEN SOURCE PROJECT",
                          color: project.isEnterprise ? AppColors.accentCyan : AppColors.accentPurple,
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.close_rounded,
                            color: AppColors.textPrimary,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Title & Subtitle
                    Text(
                      project.title,
                      style: AppTypography.heroTitle(fontSize: 32),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      project.subtitle,
                      style: AppTypography.cardTitle(
                        fontSize: 16,
                        color: AppColors.accentCyan,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description
                    Text(
                      project.description,
                      style: AppTypography.bodyLarge(fontSize: 15),
                    ),
                    const SizedBox(height: 24),

                    // Architecture & Role Box
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.glassBorder,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow("Role", project.role, AppColors.accentCyan),
                          const SizedBox(height: 10),
                          _buildDetailRow("Architecture", project.architecture, AppColors.codeAccent),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Key Contributions
                    Text(
                      "Key Contributions & Achievements",
                      style: AppTypography.cardTitle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    ...project.keyContributions.map(
                      (c) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle_outline_rounded,
                              color: AppColors.accentEmerald,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                c,
                                style: AppTypography.bodyStandard(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tech Stack Chips
                    Text(
                      "Technologies",
                      style: AppTypography.cardTitle(fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies
                          .map((tech) => GlassChip(label: tech))
                          .toList(),
                    ),
                    const SizedBox(height: 32),

                    // External Links / Close CTAs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (project.githubUrl != null) ...[
                          GlassButton(
                            text: "GitHub",
                            icon: Icons.code_rounded,
                            isPrimary: false,
                            onPressed: () => _launch(project.githubUrl!),
                          ),
                          const SizedBox(width: 12),
                        ],
                        if (project.liveUrl != null) ...[
                          GlassButton(
                            text: "Live Demo",
                            icon: Icons.launch_rounded,
                            isPrimary: true,
                            onPressed: () => _launch(project.liveUrl!),
                          ),
                          const SizedBox(width: 12),
                        ],
                        GlassButton(
                          text: "Close",
                          isPrimary: project.githubUrl == null && project.liveUrl == null,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            "$label:",
            style: AppTypography.badgeTag(color: AppColors.textMuted),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTypography.bodyStandard(
              fontSize: 14,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
