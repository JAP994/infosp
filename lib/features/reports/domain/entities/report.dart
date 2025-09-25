import 'package:equatable/equatable.dart';

class Report extends Equatable {
  final String reportNumber;
  final String detectedLocationUnit;
  final String involvedMaterialPersonnel;
  final String detailedDescription;
  final String evidenceFile;
  final String detectedDateTime;
  final String reportDateTime;

  const Report({
    required this.reportNumber,
    required this.detectedLocationUnit,
    required this.involvedMaterialPersonnel,
    required this.detailedDescription,
    required this.evidenceFile,
    required this.detectedDateTime,
    required this.reportDateTime,
  });

  @override
  List<Object?> get props => [
    reportNumber,
    detectedLocationUnit,
    involvedMaterialPersonnel,
    detailedDescription,
    evidenceFile,
    detectedDateTime,
    reportDateTime,
  ];
}
