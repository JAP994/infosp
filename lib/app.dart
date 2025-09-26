import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/router.dart'; // 👈 importa el archivo donde está appRouter

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reports App',
      theme: appTheme,
      routerConfig: appRouter, // 👈 ahora sí se reconoce
    );
  }
}
