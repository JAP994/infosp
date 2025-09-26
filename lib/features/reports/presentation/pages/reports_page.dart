import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    // Disparar la carga inicial si el estado es inicial
    if (bloc.state is ReportsInitial) {
      bloc.add(FetchReports());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
      body: BlocBuilder<ReportBloc, ReportState>(
        builder: (context, state) {
          if (state is ReportsLoading && bloc.state is ReportsInitial) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(CreateReportPage.name).then((_) {
            context.read<ReportBloc>().add(FetchReports());
          });
        },
        tooltip: 'Nuevo reporte',
        child: const Icon(Icons.add),
      ),
    );
  }
}
