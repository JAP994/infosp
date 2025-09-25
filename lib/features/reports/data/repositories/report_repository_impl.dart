// lib/features/reports/data/repositories/report_repository_impl.dart
import '../../domain/entities/report.dart';
import '../../domain/entities/report_page.dart';
import '../../domain/repositories/report_repository.dart';
import '../datasources/report_remote_datasource.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource remoteDataSource;

  ReportRepositoryImpl(this.remoteDataSource);

  @override
  Future<ReportPage> getReportsPaginated(int page, int size) async {
    final model = await remoteDataSource.getReportsPaginated(page, size);
    return ReportPage(
      reports: model.content.map((e) => e.toEntity()).toList(),
      totalPages: model.totalPages,
      isLastPage: model.last,
      currentPage: model.number,
    );
  }

  @override
  Future<Report> getReportDetail(String reportNumber) async {
    final model = await remoteDataSource.getReportByNumber(reportNumber);
    return model.toEntity();
  }
}
