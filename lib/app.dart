import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/di/injection_container.dart';
import 'config/theme.dart';
import 'features/reports/presentation/bloc/report_bloc.dart';
import 'features/reports/presentation/pages/reports_page.dart';
import 'features/reports/presentation/pages/report_detail_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración de rutas con GoRouter
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            // Inyectamos ReportBloc en la página principal
            return BlocProvider(
              create: (_) => sl<ReportBloc>(),
              child: const ReportsPage(),
            );
          },
        ),
        GoRoute(
          path: '/report_detail/:reportNumber',
          builder: (context, state) {
            final reportNumber = state.pathParameters['reportNumber']!;
            return BlocProvider.value(
              value: sl<ReportBloc>(), // Reutilizamos el mismo Bloc
              child: ReportDetailPage(reportNumber: reportNumber),
            );
          },
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reports App',
      theme: appTheme,
      routerConfig: router,
    );
  }
}
