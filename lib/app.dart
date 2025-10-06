import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reportes ISP',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
