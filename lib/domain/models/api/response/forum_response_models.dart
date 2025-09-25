part of 'gen_responses.dart';

@freezed
class AutorCardModel with _$AutorCardModel {
  const factory AutorCardModel({
    required int id,
    required String nome,
  }) = _AutorCardModel;

  factory AutorCardModel.fromJson(Map<String, dynamic> json) =>
      _$AutorCardModelFromJson(json);
}

@freezed
class PublicacaoCardModel with _$PublicacaoCardModel {
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoCardModel({
    required int id,
    required String titulo,
    required String texto,
    required DateTime dataCriacao,
    required AutorCardModel autor,
    required Set<Categorias> categorias,
    required int likesCount,
    required int comentariosCount,
    required bool isLiked,
  }) = _PublicacaoCardModel;

  // Fábrica para desserializar o JSON
  factory PublicacaoCardModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoCardModelFromJson(json);
}