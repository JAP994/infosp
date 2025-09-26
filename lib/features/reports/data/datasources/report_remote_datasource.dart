import 'dart:io';
import 'package:dio/dio.dart';
import '../models/report_model.dart';
import '../models/report_page_model.dart';

abstract class ReportRemoteDataSource {
  Future<ReportPageModel> getReportsPaginated(int page, int size);
  Future<ReportModel> getReportByNumber(String reportNumber);

  Future<ReportModel> createReport({
    required File file,
    required String detectedDateTime,
    required String detectedLocationUnit,
    required String involvedMaterialPersonnel,
    required String detailedDescription,
  });
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final Dio client;

  ReportRemoteDataSourceImpl({required this.client});

  @override
  Future<ReportPageModel> getReportsPaginated(int page, int size) async {
    final response = await client.get(
      '/reports',
      queryParameters: {'page': page, 'size': size},
    );
    return ReportPageModel.fromJson(response.data);
  }

  @override
  Future<ReportModel> getReportByNumber(String reportNumber) async {
    final response = await client.get('/reports/$reportNumber');
    return ReportModel.fromJson(response.data);
  }

  @override
  Future<ReportModel> createReport({
    required File file,
    required String detectedDateTime,
    required String detectedLocationUnit,
    required String involvedMaterialPersonnel,
    required String detailedDescription,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
      'detectedDateTime': detectedDateTime,
      'detectedLocationUnit': detectedLocationUnit,
      'involvedMaterialPersonnel': involvedMaterialPersonnel,
      'detailedDescription': detailedDescription,
    });

    final response = await client.post('/reports/upload', data: formData);

    return ReportModel.fromJson(response.data);
  }
}
