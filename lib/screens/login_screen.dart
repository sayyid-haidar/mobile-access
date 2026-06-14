import 'package:flutter/material.dart';

import '../app/garpit_app_frame.dart';
import '../app/app_theme.dart';
import '../widgets/access_device_illustration.dart';
import '../widgets/garpit_button.dart';
import '../widgets/garpit_text_field.dart';
import 'doors_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan password wajib diisi.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) => const GarpitAppFrame(child: DoorsScreen()),
      ),
    );
  }

  void _showForgotPasswordMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reset password akan disiapkan setelah integrasi API.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(24, 36, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/garpit_wordmark.png',
                width: 128,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 6),
              Text(
                'Door access for your workspace',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              const _LoginDeviceCard(),
              const SizedBox(height: 38),
              Text(
                'Masuk',
                style: textTheme.displayLarge?.copyWith(
                  fontSize: 32,
                  color: GarpitColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Gunakan akun yang sudah diberikan oleh admin gedung atau kantor.',
                style: textTheme.bodyLarge?.copyWith(fontSize: 14, height: 1.2),
              ),
              const SizedBox(height: 24),
              GarpitTextField(
                label: 'Email',
                hintText: 'nama@email.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              GarpitTextField(
                label: 'Password',
                hintText: '••••••••',
                controller: _passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _showForgotPasswordMessage,
                  style: TextButton.styleFrom(
                    foregroundColor: GarpitColors.textPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 6,
                    ),
                    textStyle: textTheme.titleMedium?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  child: const Text('Lupa password?'),
                ),
              ),
              const SizedBox(height: 14),
              GarpitButton(label: 'Masuk', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginDeviceCard extends StatelessWidget {
  const _LoginDeviceCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      decoration: BoxDecoration(
        color: GarpitColors.surface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          const AccessDeviceIllustration(compact: true),
          const SizedBox(height: 16),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Akses pintu aman untuk pengguna terdaftar',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
