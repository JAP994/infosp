import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infosp/core/di/injection_container.dart';
import 'package:infosp/core/widgets/custom_scaffold.dart';
import '../bloc/report_bloc.dart';
import '../widgets/create_report_form.dart';

class CreateReportPage extends StatelessWidget {
  static const name = 'create-report-page';
  const CreateReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ReportBloc>(),
      child: CustomScaffold(
        // backgroundColor: AppColors.white, // muesca y barra superior/inferior
        // bodyColor: AppColors.greyLight,   // fondo interno
        body: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Registrar ISP',
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CreateReportForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
