import 'dart:io';
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

  @override
  Future<Report> createReport({
    required File file,
    required String detectedDateTime,
    required String detectedLocationUnit,
    required String involvedMaterialPersonnel,
    required String detailedDescription,
  }) async {
    final model = await remoteDataSource.createReport(
      file: file,
      detectedDateTime: detectedDateTime,
      detectedLocationUnit: detectedLocationUnit,
      involvedMaterialPersonnel: involvedMaterialPersonnel,
      detailedDescription: detailedDescription,
    );
    return model.toEntity();
  }
}
