import 'package:json_annotation/json_annotation.dart';
import 'report_model.dart';
import '../../domain/entities/report_page.dart';

part 'report_page_model.g.dart';

@JsonSerializable()
class ReportPageModel {
  final List<ReportModel> content;
  final int totalPages;
  final bool last;
  final int number;

  ReportPageModel({
    required this.content,
    required this.totalPages,
    required this.last,
    required this.number,
  });

  factory ReportPageModel.fromJson(Map<String, dynamic> json) =>
      _$ReportPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPageModelToJson(this);

  ReportPage toEntity() => ReportPage(
    reports: content.map((e) => e.toEntity()).toList(),
    totalPages: totalPages,
    isLastPage: last,
    currentPage: number,
  );
}
