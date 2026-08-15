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
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _auroraController;
  late AnimationController _scanController;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    _auroraController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);

    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    for (int i = 0; i < 60; i++) {
      _particles.add(Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: _random.nextDouble() * 2.5 + 0.5,
        speed: _random.nextDouble() * 0.04 + 0.008,
        alpha: _random.nextDouble() * 0.5 + 0.05,
        isCyan: _random.nextBool(),
      ));
    }
  }

  @override
  void dispose() {
    _particleController.dispose();
    _auroraController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark background
        Container(color: AppColors.bgDark),

        // Aurora top-right cyan bloom
        Positioned(
          top: -200,
          right: -200,
          child: AnimatedBuilder(
            animation: _auroraController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + _auroraController.value * 0.15,
                child: Opacity(
                  opacity: 0.08 + _auroraController.value * 0.06,
                  child: Container(
                    width: 700,
                    height: 700,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.accentCyan,
                          Color(0xFF2979FF),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Aurora bottom-left purple bloom
        Positioned(
          bottom: -300,
          left: -200,
          child: AnimatedBuilder(
            animation: _auroraController,
            builder: (context, child) {
              final v = 1.0 - _auroraController.value;
              return Transform.scale(
                scale: 1.0 + v * 0.18,
                child: Opacity(
                  opacity: 0.07 + v * 0.05,
                  child: Container(
                    width: 800,
                    height: 800,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.accentPurple,
                          Color(0xFF2979FF),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.35, 1.0],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Mid-screen subtle blue orb
        Positioned(
          top: 300,
          left: -100,
          child: AnimatedBuilder(
            animation: _auroraController,
            builder: (context, child) {
              return Opacity(
                opacity: 0.04 + _auroraController.value * 0.03,
                child: Container(
                  width: 450,
                  height: 450,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [AppColors.accentBlue, Colors.transparent],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Animated particle + hex grid canvas
        AnimatedBuilder(
          animation: _particleController,
          builder: (context, _) {
            return CustomPaint(
              painter: DeepGridParticlePainter(
                particles: _particles,
                progress: _particleController.value,
              ),
              size: Size.infinite,
            );
          },
        ),

        // Scan line sweep
        AnimatedBuilder(
          animation: _scanController,
          builder: (context, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final y = _scanController.value * constraints.maxHeight;
                return Positioned(
                  top: y,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.accentCyan.withValues(alpha: 0.08),
                          AppColors.accentCyan.withValues(alpha: 0.15),
                          AppColors.accentCyan.withValues(alpha: 0.08),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),

        // Vignette overlay
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.4,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.35),
              ],
            ),
          ),
        ),

        // Content
        widget.child,
      ],
    );
  }
}

class Particle {
  double x, y, radius, speed, alpha;
  bool isCyan;
  Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.alpha,
    required this.isCyan,
  });
}

class DeepGridParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;

  DeepGridParticlePainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Fine dot grid
    final dotPaint = Paint()
      ..color = AppColors.glassBorder.withValues(alpha: 0.12)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;

    const double dotStep = 48.0;
    for (double x = 0; x < size.width; x += dotStep) {
      for (double y = 0; y < size.height; y += dotStep) {
        canvas.drawCircle(Offset(x, y), 0.8, dotPaint);
      }
    }

    // Subtle vertical lines
    final linePaint = Paint()
      ..color = AppColors.glassBorder.withValues(alpha: 0.04)
      ..strokeWidth = 1.0;
    const double lineStep = 120.0;
    for (double x = 0; x < size.width; x += lineStep) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }
    for (double y = 0; y < size.height; y += lineStep) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Particles
    final particlePaint = Paint();
    for (var p in particles) {
      final dy = (p.y - progress * p.speed * 3) % 1.0;
      final dx = p.x * size.width;
      final dy2 = (dy < 0 ? dy + 1.0 : dy) * size.height;

      final color = p.isCyan ? AppColors.accentCyan : AppColors.accentPurple;
      particlePaint.color = color.withValues(alpha: p.alpha);

      // Soft glow halo
      final glowPaint = Paint()
        ..color = color.withValues(alpha: p.alpha * 0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);
      canvas.drawCircle(Offset(dx, dy2), p.radius * 2.5, glowPaint);
      canvas.drawCircle(Offset(dx, dy2), p.radius, particlePaint);
    }

    // Diagonal accent lines (subtle)
    final diagPaint = Paint()
      ..color = AppColors.accentCyan.withValues(alpha: 0.025)
      ..strokeWidth = 1.0;
    for (double i = -size.height; i < size.width + size.height; i += 180) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), diagPaint);
    }
  }

  @override
  bool shouldRepaint(covariant DeepGridParticlePainter oldDelegate) => true;
}
