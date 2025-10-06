import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScaffold extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const SplashScaffold({
    super.key,
    required this.child,
    this.backgroundColor = const Color(0xFF003366),
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      body: SafeArea(top: true, bottom: true, child: child),
    );
  }
}
