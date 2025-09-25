import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/report.dart';
import '../../domain/usecases/get_reports_paginated.dart';
import '../../domain/usecases/get_report_detail.dart';
import 'report_event.dart';
import 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final GetReportsPaginated getReportsPaginated;
  final GetReportDetail getReportDetail;

  int _page = 0;
  final int _size = 10;
  List<Report> _allReports = [];

  ReportBloc({required this.getReportsPaginated, required this.getReportDetail})
    : super(ReportsInitial()) {
    on<FetchReports>(_onFetchReports);
    on<LoadMoreReports>(_onLoadMoreReports);
    on<FetchReportDetail>(_onFetchReportDetail);
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
}
