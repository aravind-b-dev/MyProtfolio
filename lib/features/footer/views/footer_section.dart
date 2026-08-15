import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/responsive_builder.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        border: Border(
          top: BorderSide(
            color: AppColors.glassBorder,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Wrap(
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            runSpacing: 16,
            children: [
              // Developer Tagline
              Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.developerName,
                    style: AppTypography.cardTitle(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.developerTitle,
                    style: AppTypography.badgeTag(
                      color: AppColors.accentCyan,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              Text(
                AppStrings.footerText,
                style: AppTypography.badgeTag(
                  color: AppColors.textMuted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.glassBorder),
          const SizedBox(height: 20),

          // Copyright
          Text(
            AppStrings.copyright,
            style: AppTypography.badgeTag(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
