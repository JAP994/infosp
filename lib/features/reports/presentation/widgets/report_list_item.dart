import 'package:flutter/material.dart';
import '../../domain/entities/report.dart';

class ReportListItem extends StatelessWidget {
  final Report report;
  const ReportListItem({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(report.reportNumber),
        subtitle: Text(report.detectedLocationUnit),
      ),
    );
  }
}
