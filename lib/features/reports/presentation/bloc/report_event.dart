import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchReports extends ReportEvent {}

class LoadMoreReports extends ReportEvent {}

class FetchReportDetail extends ReportEvent {
  final String reportNumber;
  FetchReportDetail(this.reportNumber);

  @override
  List<Object?> get props => [reportNumber];
}

// Evento para crear reporte
class CreateReportEvent extends ReportEvent {
  final String filePath;
  final String detectedDateTime;
  final String detectedLocationUnit;
  final String involvedMaterialPersonnel;
  final String detailedDescription;

  CreateReportEvent({
    required this.filePath,
    required this.detectedDateTime,
    required this.detectedLocationUnit,
    required this.involvedMaterialPersonnel,
    required this.detailedDescription,
  });

  @override
  List<Object?> get props => [
    filePath,
    detectedDateTime,
    detectedLocationUnit,
    involvedMaterialPersonnel,
    detailedDescription,
  ];
}
