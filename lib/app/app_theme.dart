import 'package:flutter/material.dart';

class GarpitColors {
  const GarpitColors._();

  static const background = Color(0xFFFFFFFF);
  static const appFrame = Color(0xFFF3F5F7);
  static const surface = Color(0xFFF7F8FA);
  static const textPrimary = Color(0xFF080A0F);
  static const textSecondary = Color(0xFF717987);
  static const border = Color(0xFFE1E5EA);
  static const teal = Color(0xFF12C7B6);
  static const activeDark = Color(0xFF0D3E4A);
  static const successBackground = Color(0xFFE2F8EF);
  static const mutedBadgeBackground = Color(0xFFEEF2F8);
}

class GarpitTheme {
  const GarpitTheme._();

  static ThemeData get light {
    const baseFont = 'System';

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: baseFont,
      scaffoldBackgroundColor: GarpitColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: GarpitColors.teal,
        brightness: Brightness.light,
        primary: GarpitColors.textPrimary,
        surface: GarpitColors.background,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: GarpitColors.textPrimary,
          fontSize: 42,
          fontWeight: FontWeight.w800,
          height: 1.02,
        ),
        headlineLarge: TextStyle(
          color: GarpitColors.textPrimary,
          fontSize: 34,
          fontWeight: FontWeight.w800,
          height: 1.08,
        ),
        headlineMedium: TextStyle(
          color: GarpitColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        titleLarge: TextStyle(
          color: GarpitColors.textPrimary,
          fontSize: 21,
          fontWeight: FontWeight.w800,
          height: 1.15,
        ),
        titleMedium: TextStyle(
          color: GarpitColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w800,
          height: 1.25,
        ),
        bodyLarge: TextStyle(
          color: GarpitColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.35,
        ),
        bodyMedium: TextStyle(
          color: GarpitColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.35,
        ),
        labelLarge: TextStyle(
          color: GarpitColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w800,
          height: 1.2,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: GarpitColors.background,
        foregroundColor: GarpitColors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
