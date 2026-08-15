import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/widgets/glass_chip.dart';

class HeroProfileFrame extends StatefulWidget {
  const HeroProfileFrame({super.key});

  @override
  State<HeroProfileFrame> createState() => _HeroProfileFrameState();
}

class _HeroProfileFrameState extends State<HeroProfileFrame>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 600;
    final frameSize = isSmall ? 300.0 : 420.0;
    final imageSize = isSmall ? 250.0 : 350.0;

    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: child,
        );
      },
      child: SizedBox(
        width: frameSize + 60,
        height: frameSize + 60,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Ambient Radial Glow Backdrop
            Container(
              width: frameSize,
              height: frameSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFFF5252).withValues(alpha: 0.3),
                    AppColors.accentCyan.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),

            // Animated Outer Glowing Arc Ring (Inspired by reference image)
            AnimatedBuilder(
              animation: _rotateController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotateController.value * 2 * math.pi,
                  child: CustomPaint(
                    size: Size(frameSize + 20, frameSize + 20),
                    painter: _RingArcPainter(),
                  ),
                );
              },
            ),

            // Profile Photo Frame
            Container(
              width: imageSize,
              height: imageSize,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF5252),
                    AppColors.accentCyan,
                    AppColors.accentPurple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF5252).withValues(alpha: 0.35),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: AppColors.accentCyan.withValues(alpha: 0.25),
                    blurRadius: 40,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.bgSurface,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 100,
                      color: AppColors.accentCyan,
                    ),
                  ),
                ),
              ),
            ),

            // Left Floating Bracket decoration (<)
            Positioned(
              left: isSmall ? -5 : -15,
              top: frameSize * 0.25,
              child: _buildCodeBracket("<", const Color(0xFFFF5252)),
            ),

            // Right Floating Bracket decoration (>)
            Positioned(
              right: isSmall ? -5 : -15,
              bottom: frameSize * 0.25,
              child: _buildCodeBracket(">", AppColors.accentCyan),
            ),

            // Top Status Chip ("AVAILABLE FOR PROJECTS")
            Positioned(
              top: isSmall ? -10 : -15,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFFF5252).withValues(alpha: 0.6),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF5252).withValues(alpha: 0.3),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF5252),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF5252),
                            blurRadius: 6,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "SENIOR FLUTTER ARCHITECT",
                      style: AppTypography.badgeTag(
                        color: Colors.white,
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Right Experience Floating Badge
            Positioned(
              bottom: isSmall ? -10 : 0,
              right: isSmall ? 10 : 20,
              child: GlassChip(
                label: "⚡ ${AppStrings.yearsOfExperience} EXP",
                color: AppColors.accentCyan,
              ),
            ),

            // Bottom Left Current Role Floating Badge
            Positioned(
              bottom: isSmall ? -10 : 0,
              left: isSmall ? 10 : 20,
              child: const GlassChip(
                label: "🏛️ TCS • SBI YONO",
                color: AppColors.accentPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBracket(String char, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.glassBase,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.25),
            blurRadius: 16,
          ),
        ],
      ),
      child: Text(
        char,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: color,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

class _RingArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;

    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFFF5252),
          Colors.transparent,
          AppColors.accentCyan,
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      math.pi * 1.2,
      false,
      paint1,
    );

    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..shader = const LinearGradient(
        colors: [
          AppColors.accentPurple,
          Colors.transparent,
          Color(0xFFFF5252),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * 0.8,
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
