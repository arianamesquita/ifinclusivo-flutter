part of 'gen_responses.dart';
@freezed
class LibrasResponseModel with _$LibrasResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory LibrasResponseModel({
    required int id,
    required String palavra,
    required String descricao,
    required String url,
     String? fileUrl,
    String? video,
    String? foto,
    String? justificativa,
    required Status status,
     Categorias? categorias,
  }) = _LibrasResponseModel;

  factory LibrasResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LibrasResponseModelFromJson(json);
}

@freezed
class LibrasRelacionadasModel with _$LibrasRelacionadasModel {
  const factory LibrasRelacionadasModel({
    required int id,
    required String palavra,
  }) = _LibrasRelacionadasModel;

  factory LibrasRelacionadasModel.fromJson(Map<String, dynamic> json) =>
      _$LibrasRelacionadasModelFromJson(json);
}