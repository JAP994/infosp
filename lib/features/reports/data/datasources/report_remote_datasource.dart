import 'package:dio/dio.dart';
import '../models/report_model.dart';
import '../models/report_page_model.dart';

abstract class ReportRemoteDataSource {
  Future<ReportPageModel> getReportsPaginated(int page, int size);
  Future<ReportModel> getReportByNumber(String reportNumber);
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final Dio client;

  ReportRemoteDataSourceImpl({required this.client});

  @override
  Future<ReportPageModel> getReportsPaginated(int page, int size) async {
    final response = await client.get(
      '/sistem/api/v1/reports',
      queryParameters: {'page': page, 'size': size},
    );
    return ReportPageModel.fromJson(response.data);
  }

  @override
  Future<ReportModel> getReportByNumber(String reportNumber) async {
    final response = await client.get('/sistem/api/v1/reports/$reportNumber');
    return ReportModel.fromJson(response.data);
  }
}
