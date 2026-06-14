import 'package:flutter/material.dart';

import '../app/app_theme.dart';

class GarpitBottomNav extends StatelessWidget {
  const GarpitBottomNav({super.key, required this.onPlaceholderTap});

  final ValueChanged<String> onPlaceholderTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: GarpitColors.background,
          border: Border(top: BorderSide(color: GarpitColors.border)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              label: 'Doors',
              icon: Icons.circle,
              active: true,
              onTap: () {},
            ),
            _NavItem(
              label: 'Access',
              icon: Icons.radio_button_unchecked,
              onTap: () => onPlaceholderTap('Access'),
            ),
            _NavItem(
              label: 'Logs',
              icon: Icons.radio_button_unchecked,
              onTap: () => onPlaceholderTap('Logs'),
            ),
            _NavItem(
              label: 'Profile',
              icon: Icons.radio_button_unchecked,
              onTap: () => onPlaceholderTap('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.active = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active
        ? GarpitColors.textPrimary
        : GarpitColors.textSecondary;

    return InkResponse(
      onTap: onTap,
      radius: 34,
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: active ? 15 : 16, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
