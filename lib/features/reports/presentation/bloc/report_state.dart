import '../../domain/entities/report.dart';

abstract class ReportState {}

// Estados existentes
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

// Estados nuevos para creación
class ReportCreating extends ReportState {}

class ReportCreatedSuccessfully extends ReportState {
  final Report report;
  ReportCreatedSuccessfully(this.report);
}

class ReportCreationError extends ReportState {
  final String message;
  ReportCreationError(this.message);
}
