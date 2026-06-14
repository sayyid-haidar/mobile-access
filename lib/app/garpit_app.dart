import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import 'garpit_app_frame.dart';
import 'app_theme.dart';

class GarpitApp extends StatelessWidget {
  const GarpitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GARPIT',
      debugShowCheckedModeBanner: false,
      theme: GarpitTheme.light,
      home: const GarpitAppFrame(child: LoginScreen()),
    );
  }
}
