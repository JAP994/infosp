import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/report_bloc.dart';
import '../bloc/report_event.dart';
import '../bloc/report_state.dart';
import 'package:go_router/go_router.dart';

class ReportDetailPage extends StatelessWidget {
  final String reportNumber;

  const ReportDetailPage({super.key, required this.reportNumber});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReportBloc>();

    // Cargar detalle solo si aún no lo tenemos
    bloc.add(FetchReportDetail(reportNumber));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Detalle del Reporte'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // Regresar manteniendo la lista
        ),
      ),
      body: BlocBuilder<ReportBloc, ReportState>(
        builder: (context, state) {
          if (state is ReportsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReportDetailLoaded) {
            final report = state.report;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    'Número: ${report.reportNumber}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Ubicación: ${report.detectedLocationUnit}'),
                  const SizedBox(height: 8),
                  Text('Involucrado: ${report.involvedMaterialPersonnel}'),
                  const SizedBox(height: 8),
                  Text('Descripción: ${report.detailedDescription}'),
                  const SizedBox(height: 8),
                  Text('Evidencia: ${report.evidenceFile}'),
                  const SizedBox(height: 8),
                  Text('Fecha detectado: ${report.detectedDateTime}'),
                  const SizedBox(height: 8),
                  Text('Fecha reporte: ${report.reportDateTime}'),
                ],
              ),
            );
          } else if (state is ReportsError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
