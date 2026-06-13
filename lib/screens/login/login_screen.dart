import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';

/// Login screen — Figma "Login Fish Monitor v1 Pond Farming" (node 144:1470).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'domat@example.com');
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _rememberMe = true;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.88,
            child: Image.asset(
              'assets/images/login_pond_farming.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(
                'assets/images/login_background.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const _LoginBackgroundFallback(),
              ),
            ),
          ),
          Container(color: AppColors.overlay),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  const _BrandingHeader(),
                  const SizedBox(height: 48),
                  _LoginCard(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    emailFocus: _emailFocus,
                    passwordFocus: _passwordFocus,
                    emailFocused: _emailFocus.hasFocus,
                    passwordFocused: _passwordFocus.hasFocus,
                    rememberMe: _rememberMe,
                    obscurePassword: _obscurePassword,
                    onRememberChanged: (v) => setState(() => _rememberMe = v),
                    onTogglePassword: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    onLogin: () => context.go('/home'),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginBackgroundFallback extends StatelessWidget {
  const _LoginBackgroundFallback();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A3D7A), Color(0xFF0145CC)],
        ),
      ),
    );
  }
}

class _BrandingHeader extends StatelessWidget {
  const _BrandingHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/login_logo_circle.png',
                width: 60,
                height: 60,
                errorBuilder: (_, __, ___) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/login_logo_fish.png',
                width: 44,
                height: 44,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.phishing,
                  size: 36,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Fishing Pond Monitor',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFBFDFE),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        const _TaglineRow(
          items: [
            'Monitor water quality',
            'Ensure fish health',
            'Improve pond productivity',
          ],
        ),
      ],
    );
  }
}

class _TaglineRow extends StatelessWidget {
  const _TaglineRow({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFFBFDFE),
    );
    final divider = Text(
      ' | ',
      style: style.copyWith(color: Colors.white.withValues(alpha: 0.65)),
    );

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) divider,
          Text(items[i], textAlign: TextAlign.center, style: style),
        ],
      ],
    );
  }
}

class _LoginCard extends StatelessWidget {
  const _LoginCard({
    required this.emailController,
    required this.passwordController,
    required this.emailFocus,
    required this.passwordFocus,
    required this.emailFocused,
    required this.passwordFocused,
    required this.rememberMe,
    required this.obscurePassword,
    required this.onRememberChanged,
    required this.onTogglePassword,
    required this.onLogin,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final bool emailFocused;
  final bool passwordFocused;
  final bool rememberMe;
  final bool obscurePassword;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onTogglePassword;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
      decoration: BoxDecoration(
        color: AppColors.loginCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome!',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          _LoginField(
            controller: emailController,
            focusNode: emailFocus,
            focused: emailFocused,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline,
            obscureText: false,
          ),
          const SizedBox(height: 16),
          _LoginField(
            controller: passwordController,
            focusNode: passwordFocus,
            focused: passwordFocused,
            prefixIcon: Icons.lock_outline,
            obscureText: obscurePassword,
            suffix: IconButton(
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20,
                color: AppColors.textSecondary,
              ),
              onPressed: onTogglePassword,
            ),
            useLightBorder: true,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                height: 18,
                width: 18,
                child: Checkbox(
                  value: rememberMe,
                  onChanged: (v) => onRememberChanged(v ?? false),
                  activeColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.inputBorder),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Remeber me',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 20 / 14,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.controller,
    required this.focusNode,
    required this.focused,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
    this.useLightBorder = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool focused;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool useLightBorder;

  @override
  Widget build(BuildContext context) {
    final borderColor = focused
        ? AppColors.primary
        : (useLightBorder ? AppColors.inputBorder : AppColors.inputBorder);

    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          prefixIcon: Icon(prefixIcon, size: 16, color: AppColors.textSecondary),
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderColor, width: focused ? 1.5 : 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
      ),
    );
  }
}
