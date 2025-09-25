import 'package:flutter/material.dart';
import '../../domain/entities/report.dart';

class ReportListItem extends StatelessWidget {
  final Report report;
  const ReportListItem({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Número: ${report.reportNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Ubicación: ${report.detectedLocationUnit}'),
            const SizedBox(height: 4),
            Text('Descripción: ${report.detailedDescription}'),
          ],
        ),
      ),
    );
  }
}
