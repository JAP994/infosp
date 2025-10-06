import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor; // barra superior/inferior
  final Color bodyColor; // fondo del body

  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = const Color(0xFF003366), // azul institucional
    this.bodyColor = const Color(0xFF003366), // 💙 también azul
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        systemNavigationBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        body: SafeArea(
          top: true,
          bottom: false,
          child: Container(
            color: bodyColor, // 💙 fondo interno
            child: body,
          ),
        ),
      ),
    );
  }
}
