import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/utils/cv_download_helper.dart';
import '../../../core/widgets/glass_button.dart';
import '../../../core/widgets/scroll_reveal.dart';
import '../../navigation/nav_controller.dart';
import 'hero_profile_frame.dart';
import 'tech_ticker_bar.dart';

class HomeSection extends StatelessWidget {
  final NavController navController;

  const HomeSection({super.key, required this.navController});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      key: navController.sectionKeys['HOME'],
      padding: EdgeInsets.only(
        top: isMobile ? 90 : 100,
        bottom: 30,
        left: isMobile ? 12 : (isTablet ? 24 : 40),
        right: isMobile ? 12 : (isTablet ? 24 : 40),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.maxContentWidth,
          ),
          child: ScrollReveal(
            keyName: 'home_section',
            child: Column(
              children: [
                // Signature Hero Purple Card Container
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    gradient: AppColors.heroCardGradient,
                    borderRadius: BorderRadius.circular(isMobile ? 20 : 32),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentPurple.withValues(alpha: 0.25),
                        blurRadius: 36,
                        spreadRadius: 2,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Subtle Background Radial Lighting
                      Positioned(
                        right: -50,
                        bottom: -50,
                        child: Container(
                          width: 450,
                          height: 450,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                AppColors.accentCyan.withValues(alpha: 0.20),
                                AppColors.accentBlue.withValues(alpha: 0.10),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Main Hero Content Layout
                      Padding(
                        padding: EdgeInsets.only(
                          top: isMobile ? 60 : 85,
                          bottom: isMobile ? 40 : 60,
                          left: isMobile ? 24 : 60,
                          right: isMobile ? 24 : 40,
                        ),
                        child: ResponsiveLayout(
                          mobile: _buildMobileLayout(context),
                          desktop: _buildDesktopLayout(context),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 36),
                const TechTickerBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Headline, Bio & Pill CTA
        Expanded(
          flex: 6,
          child: _buildHeroContent(context),
        ),
        const SizedBox(width: 32),
        // Right Column: Cutout Profile Photo against Violet Aura
        const Expanded(
          flex: 5,
          child: Center(child: HeroProfileFrame()),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeroContent(context),
        const SizedBox(height: 36),
        const Center(child: HeroProfileFrame()),
      ],
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title: Hi, I'm Aravind
        Text(
          "Hi, I'm ${AppStrings.developerName.split(' ').first}",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: isMobile ? 38 : 54,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),

        // Subhead with Gradient Shader: Senior Flutter Developer.
        ShaderMask(
          shaderCallback: (bounds) => AppColors.textGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            "${AppStrings.developerTitle}.",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: isMobile ? 24 : 36,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.25,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Bio paragraph matching the reference style
        Text(
          "A self-taught Flutter developer with over ${AppStrings.yearsOfExperience} of experience, I build responsive and user-friendly websites & apps. I focus on clean code and efficient design, ensuring seamless interactions that align with both user expectations and business objectives.",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: isMobile ? 14.5 : 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFCBD5E1),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),

        // Action CTAs - Contact & Download CV
        Wrap(
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            GlassButton(
              text: "Contact",
              icon: Icons.arrow_forward_rounded,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              onPressed: () => navController.scrollToSection('CONTACT'),
            ),
            GlassButton(
              text: "Download CV",
              icon: Icons.download_rounded,
              isPrimary: false,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              onPressed: CvDownloadHelper.downloadCV,
            ),
          ],
        ),
      ],
    );
  }
}

