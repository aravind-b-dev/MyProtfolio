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
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _rotateController;
  late AnimationController _pulseController;
  late Animation<double> _floatAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _rotateController.dispose();
    _pulseController.dispose();
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
        borderRadius: 28,
        borderColor: AppColors.glassBorderHover,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Window Chrome Bar ─────────────────────────────────────
            Row(
              children: [
                Row(
                  children: [
                    _buildDot(const Color(0xFFFF5F57)),
                    const SizedBox(width: 6),
                    _buildDot(const Color(0xFFFEBC2E)),
                    const SizedBox(width: 6),
                    _buildDot(const Color(0xFF28C840)),
                  ],
                ),
                const SizedBox(width: 14),
                Text(
                  "developer.profile.dart",
                  style: AppTypography.codeSnippet(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
                const Spacer(),
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) => Transform.scale(
                    scale: _pulseAnimation.value,
                    child: const GlassChip(
                      label: "● AVAILABLE",
                      color: AppColors.accentEmerald,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ── Profile Photo + Info ──────────────────────────────────
            Row(
              children: [
                // Glowing photo frame
                _buildProfilePhoto(),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppColors.primaryGradient.createShader(bounds),
                        child: Text(
                          AppStrings.developerName,
                          style: AppTypography.cardTitle(fontSize: 22)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppStrings.developerTitle,
                        style: AppTypography.badgeTag(
                          color: AppColors.accentCyan,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: AppColors.textMuted,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Hyderabad, India",
                            style: AppTypography.codeSnippet(
                              fontSize: 11,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Code Snippet Block ────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.glassBorder,
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCodeLine(
                      "// Senior Flutter Developer", AppColors.textMuted),
                  const SizedBox(height: 4),
                  _buildCodeLine(
                      "class AravindB extends FlutterDev {", AppColors.accentPurple),
                  _buildCodeLine(
                      "  final exp = '${AppStrings.yearsOfExperience}';",
                      AppColors.codeAccent),
                  _buildCodeLine(
                      "  final domain = 'Banking + Enterprise';",
                      AppColors.codeAccent),
                  _buildCodeLine(
                      "  final state = ['BLoC', 'MobX', 'Provider'];",
                      AppColors.accentEmerald),
                  _buildCodeLine(
                      "  void ship() => deployToProduction();",
                      AppColors.accentCyan),
                  _buildCodeLine("}", AppColors.accentPurple),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // ── Stat Row ──────────────────────────────────────────────
            Row(
              children: [
                _buildStatBox("6+", "Years"),
                const SizedBox(width: 12),
                _buildStatBox("TCS", "Company"),
                const SizedBox(width: 12),
                _buildStatBox("SBI", "YONO"),
              ],
            ),
            const SizedBox(height: 16),

            // ── Tech Badge Chips ──────────────────────────────────────
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                GlassChip(label: "Flutter", color: AppColors.accentCyan),
                GlassChip(label: "Dart", color: AppColors.accentBlue),
                GlassChip(label: "BLoC", color: AppColors.accentPurple),
                GlassChip(label: "MobX", color: AppColors.codeAccent),
                GlassChip(label: "Clean Arch", color: AppColors.accentEmerald),
                GlassChip(label: "AI / LLM", color: AppColors.accentPurple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (_, child) {
        return SizedBox(
          width: 88,
          height: 88,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Spinning gradient ring
              Transform.rotate(
                angle: _rotateController.value * 2 * 3.14159,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        AppColors.accentCyan,
                        AppColors.accentBlue,
                        AppColors.accentPurple,
                        AppColors.accentCyan.withValues(alpha: 0.1),
                        AppColors.accentCyan,
                      ],
                    ),
                  ),
                ),
              ),
              // White spacer ring
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgDark,
                ),
              ),
              // Profile photo
              ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 74,
                  height: 74,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 74,
                    height: 74,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.primaryGradient,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_rounded,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatBox(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.glassBase,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.glassBorder, width: 1),
        ),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(bounds),
              child: Text(
                value,
                style: AppTypography.cardTitle(fontSize: 16)
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              label,
              style: AppTypography.badgeTag(
                color: AppColors.textMuted,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 11,
      height: 11,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildCodeLine(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Text(
        text,
        style: AppTypography.codeSnippet(fontSize: 11.5, color: color),
      ),
    );
  }
}
