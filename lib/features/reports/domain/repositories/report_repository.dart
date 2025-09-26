import 'dart:io';
import '../entities/report.dart';
import '../entities/report_page.dart';

abstract class ReportRepository {
  Future<ReportPage> getReportsPaginated(int page, int size);
  Future<Report> getReportDetail(String reportNumber);

  // NUEVO: POST
  Future<Report> createReport({
    required File file,
    required String detectedDateTime,
    required String detectedLocationUnit,
    required String involvedMaterialPersonnel,
    required String detailedDescription,
  });
}
