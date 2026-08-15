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

        // Radial Ambient Light Blur - Top Right (Indigo Glow)
        Positioned(
          top: -150,
          right: -150,
          child: Container(
            width: 700,
            height: 700,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentIndigo.withValues(alpha: 0.14),
                  AppColors.accentBlue.withValues(alpha: 0.05),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
        ),

        // Radial Ambient Light Blur - Middle Left (Cyan Glow)
        Positioned(
          top: 350,
          left: -180,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentCyan.withValues(alpha: 0.10),
                  Colors.transparent,
                ],
                stops: const [0.0, 1.0],
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
