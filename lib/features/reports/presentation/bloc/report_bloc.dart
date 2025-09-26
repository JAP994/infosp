import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/report.dart';
import '../../domain/usecases/get_report_detail.dart';
import '../../domain/usecases/get_reports_paginated.dart';
import '../../domain/usecases/create_report.dart';
import '../../domain/usecases/report_params.dart';
import 'report_event.dart';
import 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final GetReportsPaginated getReportsPaginated;
  final GetReportDetail getReportDetail;
  final CreateReport createReportUseCase;

  int _page = 0;
  final int _size = 10;
  List<Report> _allReports = [];

  ReportBloc({
    required this.getReportsPaginated,
    required this.getReportDetail,
    required this.createReportUseCase,
  }) : super(ReportsInitial()) {
    on<FetchReports>(_onFetchReports);
    on<LoadMoreReports>(_onLoadMoreReports);
    on<FetchReportDetail>(_onFetchReportDetail);
    on<CreateReportEvent>(_onCreateReport);
  }

  Future<void> _onFetchReports(
    FetchReports event,
    Emitter<ReportState> emit,
  ) async {
    emit(ReportsLoading());
    _page = 0;
    try {
      final reportPage = await getReportsPaginated(_page, _size);
      _allReports = reportPage.reports;
      emit(
        ReportsLoaded(
          reports: _allReports,
          currentPage: _page,
          isLastPage: reportPage.isLastPage,
        ),
      );
    } catch (e) {
      emit(ReportsError(e.toString()));
    }
  }

  Future<void> _onLoadMoreReports(
    LoadMoreReports event,
    Emitter<ReportState> emit,
  ) async {
    if (state is ReportsLoaded) {
      final currentState = state as ReportsLoaded;
      if (currentState.isLastPage) return;

      try {
        _page++;
        final reportPage = await getReportsPaginated(_page, _size);
        _allReports.addAll(reportPage.reports);
        emit(
          ReportsLoaded(
            reports: _allReports,
            currentPage: _page,
            isLastPage: reportPage.isLastPage,
          ),
        );
      } catch (e) {
        emit(ReportsError(e.toString()));
      }
    }
  }

  Future<void> _onFetchReportDetail(
    FetchReportDetail event,
    Emitter<ReportState> emit,
  ) async {
    emit(ReportsLoading());
    try {
      final report = await getReportDetail(event.reportNumber);
      emit(ReportDetailLoaded(report));
    } catch (e) {
      emit(ReportsError(e.toString()));
    }
  }

  Future<void> _onCreateReport(
    CreateReportEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(ReportCreating());
    try {
      final created = await createReportUseCase(
        ReportParams(
          filePath: event.filePath,
          detectedDateTime: event.detectedDateTime,
          detectedLocationUnit: event.detectedLocationUnit,
          involvedMaterialPersonnel: event.involvedMaterialPersonnel,
          detailedDescription: event.detailedDescription,
        ),
      );
      _allReports.insert(0, created);
      emit(ReportCreatedSuccessfully(created));
      emit(
        ReportsLoaded(
          reports: _allReports,
          currentPage: _page,
          isLastPage: _allReports.length < _size,
        ),
      );
    } catch (e) {
      emit(ReportCreationError(e.toString()));
    }
  }
}
