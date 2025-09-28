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
class PublicacaoDetalhadaModel with _$PublicacaoDetalhadaModel {
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoDetalhadaModel({
    required int id,
    required String titulo,
    required String texto,
    required DateTime dataCriacao,
    required AutorCardModel usuario,
    required Set<Categorias> categorias,
    required int totalLikes,
    required int totalRespostas,
    required bool curtidoPeloUsuario,
    int? respostaEscolhidaId,
  }) = _PublicacaoDetalhadaModel;

  factory PublicacaoDetalhadaModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoDetalhadaModelFromJson(json);
}

@freezed
class PublicacaoCardModel with _$PublicacaoCardModel {
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoCardModel({
    required int id,
    String? titulo,
    required DateTime dataCriacao,
    required AutorCardModel usuario,
    required int totalLikes,
    required int totalRespostas,
    required bool curtidoPeloUsuario,
  }) = _PublicacaoCardModel;

  factory PublicacaoCardModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoCardModelFromJson(json);
}

@freezed
class PublicacaoCompletaModel with _$PublicacaoCompletaModel {
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoCompletaModel({
    required List<PublicacaoCardModel> pais,
    required PublicacaoDetalhadaModel publicacao,
    required List<PublicacaoDetalhadaModel> respostas,
  }) = _PublicacaoCompletaModel;

  factory PublicacaoCompletaModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoCompletaModelFromJson(json);
}