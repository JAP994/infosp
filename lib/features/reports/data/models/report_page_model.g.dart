// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportPageModel _$ReportPageModelFromJson(Map<String, dynamic> json) =>
    ReportPageModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => ReportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      last: json['last'] as bool,
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$ReportPageModelToJson(ReportPageModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'totalPages': instance.totalPages,
      'last': instance.last,
      'number': instance.number,
    };
