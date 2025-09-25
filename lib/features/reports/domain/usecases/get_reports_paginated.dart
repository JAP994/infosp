import '../entities/report_page.dart';
import '../repositories/report_repository.dart';

class GetReportsPaginated {
  final ReportRepository repository;

  GetReportsPaginated(this.repository);

  Future<ReportPage> call(int page, int size) async {
    return await repository.getReportsPaginated(page, size);
  }
}
