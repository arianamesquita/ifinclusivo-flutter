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
class PublicacaoCompletaModel with _$PublicacaoCompletaModel {
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoCompletaModel({
    required PublicacaoDetalhadaModel atual,
    required List<PublicacaoDetalhadaModel> pais,
  }) = _PublicacaoCompletaModel;

  factory PublicacaoCompletaModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoCompletaModelFromJson(json);
}
