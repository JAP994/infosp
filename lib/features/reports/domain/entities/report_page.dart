import 'report.dart';

class ReportPage {
  final List<Report> reports;
  final int totalPages;
  final bool isLastPage;
  final int currentPage;

  ReportPage({
    required this.reports,
    required this.totalPages,
    required this.isLastPage,
    required this.currentPage,
  });
}
