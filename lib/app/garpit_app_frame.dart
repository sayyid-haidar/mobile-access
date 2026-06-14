import 'package:flutter/material.dart';

import 'app_theme.dart';

class GarpitAppFrame extends StatelessWidget {
  const GarpitAppFrame({super.key, required this.child});

  static const double maxMobileWidth = 390;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final frameWidth = constraints.maxWidth < maxMobileWidth
            ? constraints.maxWidth
            : maxMobileWidth;

        return ColoredBox(
          color: GarpitColors.appFrame,
          child: Center(
            child: SizedBox(
              width: frameWidth,
              height: constraints.maxHeight,
              child: ColoredBox(color: GarpitColors.background, child: child),
            ),
          ),
        );
      },
    );
  }
}
