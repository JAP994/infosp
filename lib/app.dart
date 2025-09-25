import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme.dart';
import 'config/router.dart';
import 'core/di/injection_container.dart' as di;
import 'features/reports/presentation/bloc/report_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl<ReportBloc>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Reportes App',
        theme: appTheme,
        routerConfig: router,
      ),
    );
  }
}
