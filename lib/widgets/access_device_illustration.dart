import 'package:flutter/material.dart';

class AccessDeviceIllustration extends StatelessWidget {
  const AccessDeviceIllustration({
    super.key,
    this.showController = true,
    this.showReader = true,
    this.compact = false,
  });

  final bool showController;
  final bool showReader;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (showController && showReader) {
      return SizedBox(
        height: compact ? 142 : 178,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              bottom: compact ? 8 : 0,
              child: Image.asset(
                'assets/images/access_controller.png',
                width: compact ? 220 : 285,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              right: compact ? 6 : 0,
              bottom: compact ? 10 : 5,
              child: Image.asset(
                'assets/images/rfid_reader.png',
                width: compact ? 78 : 104,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      );
    }

    final asset = showController
        ? 'assets/images/access_controller.png'
        : 'assets/images/rfid_reader.png';
    final width = showController ? 285.0 : 108.0;

    return Image.asset(
      asset,
      width: compact ? width * 0.78 : width,
      fit: BoxFit.contain,
    );
  }
}
