import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'splash_scaffold.dart';
import 'package:infosp/config/app_colors.dart';

class SplashPage extends StatefulWidget {
  static const name = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      GoRouter.of(context).go('/');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScaffold(
      backgroundColor: AppColors.navyBlue, // azul marino para la muesca
      child: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image.asset(
            'assets/icon/app_icon2.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
