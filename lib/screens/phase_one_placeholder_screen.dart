import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../widgets/access_device_illustration.dart';
import '../widgets/garpit_badge.dart';
import '../widgets/garpit_button.dart';
import '../widgets/garpit_text_field.dart';

class PhaseOnePlaceholderScreen extends StatelessWidget {
  const PhaseOnePlaceholderScreen({
    super.key,
    this.title = 'GARPIT',
    this.subtitle = 'Komponen UI dasar siap',
    this.phaseLabel = 'Fase 2',
  });

  final String title;
  final String subtitle;
  final String phaseLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: _PlaceholderContent(
            title: title,
            subtitle: subtitle,
            phaseLabel: phaseLabel,
          ),
        ),
      ),
    );
  }
}

class _PlaceholderContent extends StatelessWidget {
  const _PlaceholderContent({
    required this.title,
    required this.subtitle,
    required this.phaseLabel,
  });

  final String title;
  final String subtitle;
  final String phaseLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 70),
        Text(
          title,
          style: textTheme.displayLarge?.copyWith(
            color: const Color(0xFF061731),
            fontSize: 44,
          ),
        ),
        const SizedBox(height: 12),
        Text(subtitle, style: textTheme.bodyLarge),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(22, 22, 22, 20),
          decoration: BoxDecoration(
            color: GarpitColors.surface,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccessDeviceIllustration(compact: true),
              const SizedBox(height: 18),
              Text(phaseLabel, style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Button, text field, badge, dan device illustration sudah tersedia.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 18),
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  GarpitBadge(
                    label: 'Aktif',
                    variant: GarpitBadgeVariant.activeDark,
                  ),
                  GarpitBadge(
                    label: 'Terkunci',
                    variant: GarpitBadgeVariant.muted,
                  ),
                  GarpitBadge(
                    label: 'Terbuka',
                    variant: GarpitBadgeVariant.success,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const GarpitTextField(
          label: 'Email',
          hintText: 'nama@email.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 18),
        const GarpitTextField(
          label: 'Password',
          hintText: '••••••••',
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 24),
        GarpitButton(label: 'Masuk', onPressed: () {}),
        const SizedBox(height: 12),
        GarpitButton(
          label: 'Lock Door',
          variant: GarpitButtonVariant.secondary,
          onPressed: () {},
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
