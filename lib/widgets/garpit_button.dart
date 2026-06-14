import 'package:flutter/material.dart';

import '../app/app_theme.dart';

enum GarpitButtonVariant { primary, secondary }

class GarpitButton extends StatelessWidget {
  const GarpitButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = GarpitButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final GarpitButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == GarpitButtonVariant.primary;

    return SizedBox(
      width: double.infinity,
      height: 64,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isPrimary
              ? GarpitColors.textPrimary
              : GarpitColors.background,
          foregroundColor: isPrimary
              ? GarpitColors.background
              : GarpitColors.textPrimary,
          disabledBackgroundColor: isPrimary
              ? GarpitColors.border
              : GarpitColors.surface,
          disabledForegroundColor: GarpitColors.textSecondary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(
              color: isPrimary ? GarpitColors.textPrimary : GarpitColors.border,
              width: 1.5,
            ),
          ),
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        child: Text(label),
      ),
    );
  }
}
