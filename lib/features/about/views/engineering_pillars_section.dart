import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/scroll_reveal.dart';

class EngineeringPillarsSection extends StatelessWidget {
  const EngineeringPillarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    final pillars = [
      _PillarItem(
        icon: Icons.shield_moon_rounded,
        title: "Enterprise Banking Security",
        accentColor: AppColors.accentCyan,
        description:
            "Implemented PII masking, SSL Pinning, biometrics authentication, encrypted SQLite databases, and strict token management compliant with banking standards.",
        tags: ["DigiLocker", "PII Masking", "SQL Encryption", "Biometrics"],
      ),
      _PillarItem(
        icon: Icons.speed_rounded,
        title: "High Performance & Low Latency",
        accentColor: AppColors.accentEmerald,
        description:
            "Optimized state updates, lazy-loaded lists, asset caching, and reduced API round-trips for high-concurrency mobile platforms serving millions of users.",
        tags: ["60 FPS Rendering", "Memory Optimization", "Latency Reduction"],
      ),
      _PillarItem(
        icon: Icons.account_tree_rounded,
        title: "Clean Modular Architecture",
        accentColor: AppColors.accentPurple,
        description:
            "Architected scalable codebases using Clean Architecture, BLoC, MobX, and Provider patterns ensuring 100% testability, modularity, and smooth team collaboration.",
        tags: ["Clean Architecture", "MobX", "BLoC", "TDD & Testing"],
      ),
      _PillarItem(
        icon: Icons.psychology_rounded,
        title: "Generative AI & RAG Solutions",
        accentColor: AppColors.accentBlue,
        description:
            "Pioneered AI RAG chatbots using Python and Google Gemini LLMs for SBI YONO 2.0. Eliminating hallucinations while preserving user data privacy.",
        tags: ["Gemini LLM", "RAG Pipeline", "Python Integration", "TCS AI Hackathon Winner"],
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: ScrollReveal(
            keyName: 'engineering_pillars',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlassChip(
                  label: "ENGINEERING STANDARDS",
                  color: AppColors.accentCyan,
                ),
                const SizedBox(height: 12),
                Text(
                  "Core Engineering Pillars",
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 28 : 38,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "How I design, build, and deliver high-scale Flutter applications for production.",
                  style: AppTypography.bodyLarge(
                    fontSize: isMobile ? 15 : 17,
                  ),
                ),
                const SizedBox(height: 36),

                // Grid of Pillars
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pillars.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: isMobile ? 1.05 : 1.35,
                  ),
                  itemBuilder: (context, index) {
                    final item = pillars[index];
                    return GlassContainer(
                      padding: const EdgeInsets.all(24),
                      borderColor: item.accentColor.withValues(alpha: 0.3),
                      hoverBorderColor: item.accentColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: item.accentColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  item.icon,
                                  color: item.accentColor,
                                  size: 26,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                item.title,
                                style: AppTypography.cardTitle(fontSize: 19),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item.description,
                                style: AppTypography.bodyStandard(
                                  fontSize: 13.5,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: item.tags
                                .map((t) => GlassChip(
                                      label: t,
                                      color: item.accentColor,
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PillarItem {
  final IconData icon;
  final String title;
  final Color accentColor;
  final String description;
  final List<String> tags;

  _PillarItem({
    required this.icon,
    required this.title,
    required this.accentColor,
    required this.description,
    required this.tags,
  });
}
