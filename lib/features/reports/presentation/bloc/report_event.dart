abstract class ReportEvent {}

class FetchReports extends ReportEvent {}

class LoadMoreReports extends ReportEvent {}

class FetchReportDetail extends ReportEvent {
  final String reportNumber;
  FetchReportDetail(this.reportNumber);
}
