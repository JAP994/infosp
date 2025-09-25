import '../../domain/entities/report.dart';

abstract class ReportState {}

class ReportsInitial extends ReportState {}

class ReportsLoading extends ReportState {}

class ReportsLoaded extends ReportState {
  final List<Report> reports;
  final int currentPage;
  final bool isLastPage;

  ReportsLoaded({
    required this.reports,
    required this.currentPage,
    required this.isLastPage,
  });
}

class ReportsError extends ReportState {
  final String message;
  ReportsError(this.message);
}

class ReportDetailLoaded extends ReportState {
  final Report report;
  ReportDetailLoaded(this.report);
}
