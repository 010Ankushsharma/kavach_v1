class CropDiseaseResult {
  final String disease;
  final String description;
  final String prevention;

  CropDiseaseResult({
    required this.disease,
    required this.description,
    required this.prevention,
  });

  factory CropDiseaseResult.fromJson(Map<String, dynamic> json) {
    return CropDiseaseResult(
      disease: json['disease'] ?? 'Unknown',
      description: json['description'] ?? '',
      prevention: json['prevention'] ?? '',
    );
  }
}
