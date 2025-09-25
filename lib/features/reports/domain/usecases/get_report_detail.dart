import '../entities/report.dart';
import '../repositories/report_repository.dart';

class GetReportDetail {
  final ReportRepository repository;

  GetReportDetail(this.repository);

  Future<Report> call(String reportNumber) async {
    return await repository.getReportDetail(reportNumber);
  }
}
