import 'package:go_router/go_router.dart';
import 'package:infosp/features/reports/presentation/pages/splash_page.dart';
import '../features/reports/presentation/pages/reports_page.dart';
import '../features/reports/presentation/pages/report_detail_page.dart';
import '../features/reports/presentation/pages/create_report_page.dart';
import '../core/di/injection_container.dart';
import '../features/reports/presentation/bloc/report_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: SplashPage.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/',
      name: ReportsPage.name,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<ReportBloc>(),
          child: const ReportsPage(),
        );
      },
    ),
    GoRoute(
      path: '/report_detail/:reportNumber',
      name: 'report-detail',
      builder: (context, state) {
        final reportNumber = state.pathParameters['reportNumber']!;
        return BlocProvider.value(
          value: sl<ReportBloc>(),
          child: ReportDetailPage(reportNumber: reportNumber),
        );
      },
    ),
    GoRoute(
      path: '/create-report',
      name: CreateReportPage.name,
      builder: (context, state) {
        return BlocProvider.value(
          value: sl<ReportBloc>(),
          child: const CreateReportPage(),
        );
      },
    ),
  ],
);
