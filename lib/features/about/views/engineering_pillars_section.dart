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
        icon: Icons.shield_outlined,
        title: "Enterprise Banking Security",
        accentColor: AppColors.accentIndigo,
        description:
            "Implemented PII masking, SSL Pinning, biometrics, encrypted SQLite databases, and token handling compliant with banking security standards.",
        tags: ["DigiLocker", "PII Masking", "SQL Encryption"],
      ),
      _PillarItem(
        icon: Icons.speed_rounded,
        title: "Performance & Low Latency",
        accentColor: AppColors.accentBlue,
        description:
            "Optimized state updates, lazy-loaded lists, asset caching, and reduced API round-trips for high-scale apps serving millions of active users.",
        tags: ["60 FPS", "Memory Tuning", "Latency Reduction"],
      ),
      _PillarItem(
        icon: Icons.account_tree_outlined,
        title: "Clean Modular Architecture",
        accentColor: AppColors.accentCyan,
        description:
            "Architected scalable codebases using Clean Architecture, BLoC, MobX, and Provider patterns ensuring testability and modular maintainability.",
        tags: ["Clean Arch", "MobX", "BLoC", "TDD Testing"],
      ),
      _PillarItem(
        icon: Icons.psychology_outlined,
        title: "Generative AI & RAG Solutions",
        accentColor: AppColors.accentEmerald,
        description:
            "Pioneered AI RAG chatbots using Python and Gemini LLM for SBI YONO 2.0. Eliminating hallucinations while preserving user data privacy.",
        tags: ["Gemini LLM", "RAG Pipeline", "TCS AI Hackathon"],
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.maxContentWidth,
          ),
          child: ScrollReveal(
            keyName: 'engineering_pillars',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlassChip(
                  label: "CORE COMPETENCIES",
                  color: AppColors.accentIndigo,
                ),
                const SizedBox(height: 10),
                Text(
                  "Engineering Pillars & Standards",
                  style: AppTypography.sectionTitle(
                    fontSize: isMobile ? 24 : 34,
                  ),
                ),
                const SizedBox(height: 24),

                // Grid of Pillars
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pillars.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isMobile ? 1.5 : (isTablet ? 1.9 : 2.3),
                  ),
                  itemBuilder: (context, index) {
                    final item = pillars[index];
                    return GlassContainer(
                      padding: const EdgeInsets.all(20),
                      borderRadius: 14,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    item.icon,
                                    color: item.accentColor,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      item.title,
                                      style: AppTypography.cardTitle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item.description,
                                style: AppTypography.bodyStandard(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: item.tags
                                .map(
                                  (t) => GlassChip(
                                    label: t,
                                    color: item.accentColor,
                                  ),
                                )
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
