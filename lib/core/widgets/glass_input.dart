import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

class GlassInput extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const GlassInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<GlassInput> createState() => _GlassInputState();
}

class _GlassInputState extends State<GlassInput> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTypography.badgeTag(
            color: _isFocused ? AppColors.accentCyan : AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: AppColors.glassBase,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isFocused ? AppColors.accentCyan : AppColors.glassBorder,
                  width: _isFocused ? 1.5 : 1.0,
                ),
                boxShadow: [
                  if (_isFocused)
                    BoxShadow(
                      color: AppColors.accentCyan.withValues(alpha: 0.2),
                      blurRadius: 16,
                      spreadRadius: 1,
                    ),
                ],
              ),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                maxLines: widget.maxLines,
                validator: widget.validator,
                keyboardType: widget.keyboardType,
                style: AppTypography.bodyStandard(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: AppTypography.bodyStandard(color: AppColors.textMuted),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  border: InputBorder.none,
                  errorStyle: AppTypography.badgeTag(color: Colors.redAccent),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
