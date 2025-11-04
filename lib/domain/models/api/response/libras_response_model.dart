part of 'gen_responses.dart';
@freezed
class LibrasResponseModel with _$LibrasResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory LibrasResponseModel({
    required int id,
    required String palavra,
    required String descricao,
    required String url,
    String? video,
    String? foto,
    String? justificativa,
    required Status status,
    required Categorias categorias,
  }) = _LibrasResponseModel;

  factory LibrasResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LibrasResponseModelFromJson(json);
}