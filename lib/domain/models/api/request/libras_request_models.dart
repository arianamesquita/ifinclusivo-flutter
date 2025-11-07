part of 'gen_requests.dart';

@freezed
class LibrasRequestModel with _$LibrasRequestModel {
  const factory LibrasRequestModel({
    required String palavra,
    required String descricao,
    String? url,
    String? video,
    String? foto,
    String? justificativa,
    required Status status,
    required Categorias categorias,
  }) = _LibrasRequestModel;

  factory LibrasRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LibrasRequestModelFromJson(json);
}

@freezed
class SugereLibrasModel with _$SugereLibrasModel {
  const factory SugereLibrasModel({
    required String palavra,
    required String descricao,
    String? url,
  }) = _SugereLibrasModel;

  factory SugereLibrasModel.fromJson(Map<String, dynamic> json) =>
      _$SugereLibrasModelFromJson(json);
}

class SugereLibrasUploadModel {
  final SugereLibrasModel data;

  final File? videoFile;

  final Uint8List? videoBytes;
  final String? videoName;

  SugereLibrasUploadModel({
    required this.data,
    this.videoFile,
    this.videoBytes,
    this.videoName,
  });

  bool get hasVideo => videoFile != null || videoBytes != null;
}
@freezed
class AnalisePalavraRequestModel with _$AnalisePalavraRequestModel {
  const factory AnalisePalavraRequestModel({
    required String palavra,
    required Categorias categorias,
    required Status status,
    required String Justificativa,
    String? url,
    String? video,
    String? foto,
  }) = _AnalisePalavraRequestModel;

  factory AnalisePalavraRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnalisePalavraRequestModelFromJson(json);
}