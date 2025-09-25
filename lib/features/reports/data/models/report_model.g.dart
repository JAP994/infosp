// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
  reportNumber: json['reportNumber'] as String,
  detectedLocationUnit: json['detectedLocationUnit'] as String,
  involvedMaterialPersonnel: json['involvedMaterialPersonnel'] as String,
  detailedDescription: json['detailedDescription'] as String,
  evidenceFile: json['evidenceFile'] as String,
  detectedDateTime: json['detectedDateTime'] as String,
  reportDateTime: json['reportDateTime'] as String,
);

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'reportNumber': instance.reportNumber,
      'detectedLocationUnit': instance.detectedLocationUnit,
      'involvedMaterialPersonnel': instance.involvedMaterialPersonnel,
      'detailedDescription': instance.detailedDescription,
      'evidenceFile': instance.evidenceFile,
      'detectedDateTime': instance.detectedDateTime,
      'reportDateTime': instance.reportDateTime,
    };
