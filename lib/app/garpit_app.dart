import 'package:flutter/material.dart';

import '../screens/phase_one_placeholder_screen.dart';
import 'app_theme.dart';

class GarpitApp extends StatelessWidget {
  const GarpitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GARPIT',
      debugShowCheckedModeBanner: false,
      theme: GarpitTheme.light,
      home: const GarpitAppFrame(child: PhaseOnePlaceholderScreen()),
    );
  }
}

class GarpitAppFrame extends StatelessWidget {
  const GarpitAppFrame({super.key, required this.child});

  static const double maxMobileWidth = 480;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: GarpitColors.appFrame,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxMobileWidth),
          child: ColoredBox(color: GarpitColors.background, child: child),
        ),
      ),
    );
  }
}
