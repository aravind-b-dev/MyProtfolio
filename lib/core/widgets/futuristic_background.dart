import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FuturisticBackground extends StatefulWidget {
  final Widget child;

  const FuturisticBackground({super.key, required this.child});

  @override
  State<FuturisticBackground> createState() => _FuturisticBackgroundState();
}

class _FuturisticBackgroundState extends State<FuturisticBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Generate 35 subtle particles
    for (int i = 0; i < 35; i++) {
      _particles.add(Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: _random.nextDouble() * 2.0 + 1.0,
        speed: _random.nextDouble() * 0.05 + 0.01,
        alpha: _random.nextDouble() * 0.4 + 0.1,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Deep background color
        Container(color: AppColors.bgDark),

        // Glow Orbs in corners
        Positioned(
          top: -150,
          right: -150,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentCyan.withValues(alpha: 0.12),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -200,
          left: -150,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accentPurple.withValues(alpha: 0.10),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Animated Particle & Grid Canvas
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              painter: GridParticlePainter(
                particles: _particles,
                progress: _controller.value,
              ),
              size: Size.infinite,
            );
          },
        ),

        // Foreground content
        widget.child,
      ],
    );
  }
}

class Particle {
  double x;
  double y;
  double radius;
  double speed;
  double alpha;

  Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.alpha,
  });
}

class GridParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;

  GridParticlePainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.glassBorder.withValues(alpha: 0.04)
      ..strokeWidth = 1.0;

    const double step = 60.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final particlePaint = Paint();
    for (var p in particles) {
      final dy = (p.y - progress * p.speed) % 1.0;
      final px = p.x * size.width;
      final py = dy * size.height;

      particlePaint.color = AppColors.accentCyan.withValues(alpha: p.alpha);
      canvas.drawCircle(Offset(px, py), p.radius, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant GridParticlePainter oldDelegate) => true;
}
