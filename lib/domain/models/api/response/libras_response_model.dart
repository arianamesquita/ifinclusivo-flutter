part of 'gen_responses.dart';
@freezed
class LibrasResponseModel with _$LibrasResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory LibrasResponseModel({
    required String id,
    required String palavra,
    required String descricao,
    String? url,
    String? video,
    String? foto,
    String? justificativa,
    required Status status,
    required Categorias categorias,
    required List<SimpleUsuarioModel> sugeriu,
    required List<SimpleUsuarioModel> interprete, // Union garantirá que sejam Intérpretes
  }) = _LibrasResponseModel;

  factory LibrasResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LibrasResponseModelFromJson(json);
}