import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infosp/core/di/injection_container.dart';
import '../bloc/report_bloc.dart';
import '../widgets/create_report_form.dart';

class CreateReportPage extends StatelessWidget {
  static const name = 'create-report-page';
  const CreateReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ReportBloc>(), // Reutilizamos el mismo bloc ya inicializado
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Registrar ISP'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: CreateReportForm(),
        ),
      ),
    );
  }
}
