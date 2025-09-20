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