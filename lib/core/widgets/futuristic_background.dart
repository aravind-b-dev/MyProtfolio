import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FuturisticBackground extends StatelessWidget {
  final Widget child;

  const FuturisticBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base obsidian dark background
        Container(color: AppColors.bgDark),

        // Radial Ambient Light Blur - Top Center/Right (Purple & Magenta Glow)
        Positioned(
          top: -180,
          right: -100,
          child: Container(
            width: 800,
            height: 800,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentPurple.withValues(alpha: 0.22),
                  AppColors.accentPink.withValues(alpha: 0.12),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
        ),

        // Radial Ambient Light Blur - Middle Left (Cyan & Violet Glow)
        Positioned(
          top: 350,
          left: -200,
          child: Container(
            width: 700,
            height: 700,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentCyan.withValues(alpha: 0.14),
                  AppColors.accentIndigo.withValues(alpha: 0.08),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),

        // Subtle matrix dot grid overlay
        CustomPaint(
          painter: _GlassGridPainter(),
          size: Size.infinite,
        ),

        // Foreground page content
        child,
      ],
    );
  }
}

class _GlassGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()
      ..color = AppColors.glassBorder.withValues(alpha: 0.25)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    const double step = 44.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.8, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
