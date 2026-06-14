import 'package:flutter/material.dart';

import '../app/app_theme.dart';

enum GarpitBadgeVariant { activeDark, success, muted, selected }

class GarpitBadge extends StatelessWidget {
  const GarpitBadge({
    super.key,
    required this.label,
    this.variant = GarpitBadgeVariant.muted,
  });

  final String label;
  final GarpitBadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = _colorsFor(variant);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: colors.foreground,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  _BadgeColors _colorsFor(GarpitBadgeVariant variant) {
    return switch (variant) {
      GarpitBadgeVariant.activeDark => const _BadgeColors(
        background: GarpitColors.activeDark,
        foreground: GarpitColors.teal,
      ),
      GarpitBadgeVariant.success => const _BadgeColors(
        background: GarpitColors.successBackground,
        foreground: Color(0xFF05A77E),
      ),
      GarpitBadgeVariant.muted => const _BadgeColors(
        background: GarpitColors.mutedBadgeBackground,
        foreground: GarpitColors.textPrimary,
      ),
      GarpitBadgeVariant.selected => const _BadgeColors(
        background: Color(0xFFE2F9F5),
        foreground: Color(0xFF05A77E),
      ),
    };
  }
}

class _BadgeColors {
  const _BadgeColors({required this.background, required this.foreground});

  final Color background;
  final Color foreground;
}
