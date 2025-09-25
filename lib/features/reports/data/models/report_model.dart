import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/report.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  final String reportNumber;
  final String detectedLocationUnit;
  final String involvedMaterialPersonnel;
  final String detailedDescription;
  final String evidenceFile;
  final String reportDateTime;
  final String detectedDateTime;

  ReportModel({
    required this.reportNumber,
    required this.detectedLocationUnit,
    required this.involvedMaterialPersonnel,
    required this.detailedDescription,
    required this.evidenceFile,
    required this.reportDateTime,
    required this.detectedDateTime,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);

  Report toEntity() {
    return Report(
      reportNumber: reportNumber,
      detectedLocationUnit: detectedLocationUnit,
      involvedMaterialPersonnel: involvedMaterialPersonnel,
      detailedDescription: detailedDescription,
      evidenceFile: evidenceFile,
      reportDateTime: reportDateTime,
      detectedDateTime: detectedDateTime,
    );
  }
}
