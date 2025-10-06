import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infosp/config/app_colors.dart';
import 'package:infosp/core/widgets/custom_scaffold.dart';
import '../bloc/report_bloc.dart';
import '../bloc/report_event.dart';
import '../bloc/report_state.dart';
import '../widgets/report_list_item.dart';
import 'create_report_page.dart';
import 'package:go_router/go_router.dart';

class ReportsPage extends StatelessWidget {
  static const name = 'reports-page';
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReportBloc>();

    if (bloc.state is ReportsInitial) {
      bloc.add(FetchReports());
    }

    return CustomScaffold(
      backgroundColor: AppColors.white, // muesca blanca
      bodyColor: AppColors.greyLight, // fondo gris claro
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Reportes ISP',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          Expanded(
            child: BlocBuilder<ReportBloc, ReportState>(
              builder: (context, state) {
                if (state is ReportsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReportsLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.reports.length,
                          itemBuilder: (context, index) {
                            final report = state.reports[index];
                            return GestureDetector(
                              onTap: () => context.push(
                                '/report_detail/${report.reportNumber}',
                              ),
                              child: ReportListItem(report: report),
                            );
                          },
                        ),
                      ),
                      if (!state.isLastPage)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => bloc.add(LoadMoreReports()),
                            child: const Text('Cargar más'),
                          ),
                        ),
                    ],
                  );
                } else if (state is ReportsError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed(CreateReportPage.name);
          if (context.mounted) {
            context.read<ReportBloc>().add(FetchReports());
          }
        },
        tooltip: 'Nuevo reporte',
        child: const Icon(Icons.add),
      ),
    );
  }
}
