import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isPrimary;
  final double? width;
  final EdgeInsetsGeometry padding;

  const GlassButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isPrimary = true,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isPrimary) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.width,
            padding: widget.padding,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentCyan.withValues(alpha: _isHovered ? 0.5 : 0.25),
                  blurRadius: _isHovered ? 20 : 12,
                  spreadRadius: _isHovered ? 2 : 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: AppTypography.navLink(
                    color: Colors.black,
                    isSelected: true,
                  ).copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (widget.icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    widget.icon,
                    size: 18,
                    color: Colors.black,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    // Glass Secondary Button
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.width,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.accentCyan.withValues(alpha: 0.1)
                    : AppColors.glassBase,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isHovered ? AppColors.accentCyan : AppColors.glassBorder,
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: AppTypography.navLink(
                      color: _isHovered ? AppColors.accentCyan : AppColors.textPrimary,
                    ),
                  ),
                  if (widget.icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      widget.icon,
                      size: 18,
                      color: _isHovered ? AppColors.accentCyan : AppColors.textPrimary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
