import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infosp/config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor; // muesca + barra inferior
  final Color bodyColor; // fondo interno del contenido
  final Widget? floatingActionButton;

  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = AppColors.white,
    this.bodyColor = AppColors.greyLight,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    // Forzar color de muesca y barra inferior
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor, // cubre toda la pantalla
      extendBody: true,
      body: Stack(
        children: [
          // Fondo que cubre toda la pantalla, incluida la muesca
          Container(color: backgroundColor),
          // Contenido seguro dentro de la SafeArea
          SafeArea(
            top: true,
            bottom: true,
            child: Container(
              color: bodyColor, // fondo interno del contenido
              child: body,
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
