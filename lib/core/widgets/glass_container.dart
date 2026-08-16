import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double blur;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hoverBorderColor;
  final bool enableHoverEffect;
  final VoidCallback? onTap;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = 16.0,
    this.blur = 12.0,
    this.backgroundColor,
    this.borderColor,
    this.hoverBorderColor,
    this.enableHoverEffect = true,
    this.onTap,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = _isHovered && widget.enableHoverEffect
        ? (widget.hoverBorderColor ?? AppColors.glassBorderHover)
        : (widget.borderColor ?? AppColors.glassBorder);

    final effectiveBgColor = widget.backgroundColor ?? AppColors.glassBase;

    Widget containerContent = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? const EdgeInsets.all(20.0),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: effectiveBgColor,
        gradient: AppColors.glassFillGradient,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: effectiveBorderColor,
          width: _isHovered && widget.enableHoverEffect ? 1.5 : 1.0,
        ),
        boxShadow: [
          if (_isHovered && widget.enableHoverEffect)
            BoxShadow(
              color: AppColors.accentPurple.withValues(alpha: 0.25),
              blurRadius: 24.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 8),
            )
          else
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 16.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: widget.child,
    );

    final isMobile = MediaQuery.of(context).size.width < 768;

    Widget clipWidget = isMobile
        ? ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: containerContent,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
              child: containerContent,
            ),
          );

    if (widget.onTap != null || widget.enableHoverEffect) {
      return MouseRegion(
        onEnter: (_) {
          if (widget.enableHoverEffect) {
            setState(() => _isHovered = true);
          }
        },
        onExit: (_) {
          if (widget.enableHoverEffect) {
            setState(() => _isHovered = false);
          }
        },
        cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: _isHovered && widget.enableHoverEffect ? 1.012 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: clipWidget,
          ),
        ),
      );
    }

    return clipWidget;
  }
}
