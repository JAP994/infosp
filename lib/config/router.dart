import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/reports/presentation/pages/reports_page.dart';
import '../features/reports/presentation/pages/report_detail_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ReportsPage();
      },
    ),
    GoRoute(
      path: '/report_detail/:reportNumber',
      builder: (BuildContext context, GoRouterState state) {
        // ✅ se usa pathParameters
        final reportNumber = state.pathParameters['reportNumber']!;
        return ReportDetailPage(reportNumber: reportNumber);
      },
    ),
  ],
);
