import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/report.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel extends Report {
  const ReportModel({
    required super.reportNumber,
    required super.detectedLocationUnit,
    required super.involvedMaterialPersonnel,
    required super.detailedDescription,
    required super.evidenceFile,
    required super.detectedDateTime,
    required super.reportDateTime,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);

  Report toEntity() => Report(
    reportNumber: reportNumber,
    detectedLocationUnit: detectedLocationUnit,
    involvedMaterialPersonnel: involvedMaterialPersonnel,
    detailedDescription: detailedDescription,
    evidenceFile: evidenceFile,
    detectedDateTime: detectedDateTime,
    reportDateTime: reportDateTime,
  );
}
