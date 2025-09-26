import 'dart:io';
import 'package:infosp/features/reports/domain/entities/report.dart';

import '../repositories/report_repository.dart';
import 'report_params.dart';

class CreateReport {
  final ReportRepository repository;
  CreateReport(this.repository);

  Future<Report> call(ReportParams params) async {
    return repository.createReport(
      file: File(params.filePath),
      detectedDateTime: params.detectedDateTime,
      detectedLocationUnit: params.detectedLocationUnit,
      involvedMaterialPersonnel: params.involvedMaterialPersonnel,
      detailedDescription: params.detailedDescription,
    );
  }
}
