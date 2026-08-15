import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_container.dart';

class FloatingDevCard extends StatefulWidget {
  const FloatingDevCard({super.key});

  @override
  State<FloatingDevCard> createState() => _FloatingDevCardState();
}

class _FloatingDevCardState extends State<FloatingDevCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(
        parent: _floatController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: child,
        );
      },
      child: GlassContainer(
        width: 480,
        padding: const EdgeInsets.all(28),
        borderRadius: 24,
        borderColor: AppColors.glassBorderHover,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Bar with Window Dots & Title
            Row(
              children: [
                Row(
                  children: [
                    _buildDot(Colors.redAccent),
                    const SizedBox(width: 6),
                    _buildDot(Colors.amberAccent),
                    const SizedBox(width: 6),
                    _buildDot(Colors.greenAccent),
                  ],
                ),
                const SizedBox(width: 16),
                Text(
                  "FlutterArchitect.dart",
                  style: AppTypography.codeSnippet(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
                const Spacer(),
                const GlassChip(
                  label: "ONLINE",
                  color: AppColors.accentEmerald,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Main Developer Bio / Metrics
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentCyan.withValues(alpha: 0.4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.flutter_dash_rounded,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.developerName,
                      style: AppTypography.cardTitle(fontSize: 22),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.developerTitle,
                      style: AppTypography.badgeTag(
                        color: AppColors.accentCyan,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Monospace Code Snippet Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.glassBorder,
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCodeLine("class SeniorFlutterDeveloper {", AppColors.accentPurple),
                  _buildCodeLine("  final exp = '${AppStrings.yearsOfExperience}'; ", AppColors.codeAccent),
                  _buildCodeLine("  final focus = ['Architecture', 'Performance'];", AppColors.codeAccent),
                  _buildCodeLine("  final state = ['Bloc', 'Provider', 'Riverpod'];", AppColors.codeAccent),
                  _buildCodeLine("  void buildProductionApp() => deployWeb();", AppColors.accentCyan),
                  _buildCodeLine("}", AppColors.accentPurple),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Floating Badges Grid
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                GlassChip(label: "5.6+ YRS EXP", color: AppColors.accentCyan),
                GlassChip(label: "CLEAN ARCH", color: AppColors.accentPurple),
                GlassChip(label: "FLUTTER WEB", color: AppColors.accentBlue),
                GlassChip(label: "BLOC PATTERN", color: AppColors.codeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCodeLine(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        style: AppTypography.codeSnippet(
          fontSize: 12,
          color: color,
        ),
      ),
    );
  }
}
