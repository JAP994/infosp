import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/router.dart';
import 'core/widgets/custom_scaffold.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Resportes ISP',
      theme: appTheme,
      routerConfig: appRouter,
      builder: (context, child) {
        // 👇 Todo child del router se envuelve automáticamente
        return CustomScaffold(
          backgroundColor: const Color.fromARGB(
            255,
            222,
            218,
            213,
          ), // azul institucional
          bodyColor: Colors.white, // fondo del body
          body: child ?? const SizedBox(),
        );
      },
    );
  }
}
