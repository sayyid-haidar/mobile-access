import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import 'garpit_badge.dart';

class AccessPassCard extends StatelessWidget {
  const AccessPassCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 20, 18, 18),
      decoration: BoxDecoration(
        color: GarpitColors.surface,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A061731),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GARPIT ACCESS PASS',
                  style: textTheme.labelLarge?.copyWith(
                    fontSize: 12,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 16),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sayid Haidar',
                    style: textTheme.headlineMedium?.copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Member Access',
                  style: textTheme.titleMedium?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 14),
                const GarpitBadge(
                  label: 'Aktif',
                  variant: GarpitBadgeVariant.activeDark,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'assets/images/rfid_reader.png',
            width: 68,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
