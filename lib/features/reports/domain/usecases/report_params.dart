class ReportParams {
  final String filePath;
  final String detectedDateTime;
  final String detectedLocationUnit;
  final String involvedMaterialPersonnel;
  final String detailedDescription;

  ReportParams({
    required this.filePath,
    required this.detectedDateTime,
    required this.detectedLocationUnit,
    required this.involvedMaterialPersonnel,
    required this.detailedDescription,
  });
}
