import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/utils/cv_download_helper.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../navigation/nav_controller.dart';
import '../services/contact_service.dart';
import 'contact_form.dart';

class ContactSection extends StatelessWidget {
  final NavController navController;

  const ContactSection({super.key, required this.navController});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      key: navController.sectionKeys['CONTACT'],
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: ScrollReveal(
            keyName: 'contact_section',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                const GlassChip(
                  label: "GET IN TOUCH",
                  color: AppColors.accentPurple,
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.contactTitle,
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 24 : 34,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.contactSubtitle,
                  style: AppTypography.bodyLarge(
                    fontSize: isMobile ? 14.5 : 16.0,
                  ),
                ),
                const SizedBox(height: 30),

                // Responsive Layout
                ResponsiveLayout(
                  mobile: Column(
                    children: [
                      _buildContactInfo(context),
                      const SizedBox(height: 24),
                      ContactForm(contactService: MockContactService()),
                    ],
                  ),
                  desktop: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _buildContactInfo(context),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 7,
                        child: ContactForm(contactService: MockContactService()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      borderRadius: 14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Direct Contact Details",
            style: AppTypography.cardTitle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            Icons.phone_android_rounded,
            "PHONE",
            AppStrings.phoneNumber,
            () => _launch("tel:${AppStrings.phoneNumber.replaceAll(' ', '')}"),
          ),
          const SizedBox(height: 14),
          _buildInfoItem(
            Icons.email_outlined,
            "EMAIL",
            AppStrings.emailAddress,
            () => _launch("mailto:${AppStrings.emailAddress}"),
          ),
          const SizedBox(height: 14),
          _buildInfoItem(
            Icons.location_on_outlined,
            "LOCATION",
            AppStrings.location,
            null,
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.glassBorder),
          const SizedBox(height: 16),
          Text(
            "Professional Networks",
            style: AppTypography.badgeTag(color: AppColors.textMuted),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildSocialButton("GitHub", Icons.code_rounded, () {
                _launch(AppStrings.githubUrl);
              }),
              _buildSocialButton("LinkedIn", Icons.work_outline_rounded, () {
                _launch(AppStrings.linkedinUrl);
              }),
              _buildSocialButton("Download CV", Icons.download_rounded, () {
                CvDownloadHelper.downloadCV();
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      IconData icon, String label, String value, VoidCallback? onTap) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.accentPurple.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.accentPurple, size: 18),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTypography.badgeTag(
                    fontSize: 10,
                    color: AppColors.textMuted,
                  ),
                ),
                Text(
                  value,
                  style: AppTypography.bodyStandard(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label, IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.bgDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.glassBorder,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 15, color: AppColors.accentIndigo),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTypography.badgeTag(color: AppColors.textPrimary, fontSize: 11.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
