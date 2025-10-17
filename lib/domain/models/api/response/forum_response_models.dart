part of 'gen_responses.dart';

@freezed
class AutorCardModel with _$AutorCardModel {
  const factory AutorCardModel({
    required int id,
    required String nome,
    required String imgPerfil
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
    required TipoPublicacao tipo,
    required int totalLikes,
    required int totalRespostas,
    required bool curtidoPeloUsuario,
    int? respostaEscolhidaId,
  }) = _PublicacaoDetalhadaModel;

  factory PublicacaoDetalhadaModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoDetalhadaModelFromJson(json);
}

@freezed
class ComentarioResponseModel with _$ComentarioResponseModel {
  const factory ComentarioResponseModel({
    required int id,
    required String texto,
    required DateTime dataCriacao,
    required AutorCardModel usuario,
    required int publicacaoId,
    required int totalLikes,
    required int totalRespostas,
    required bool curtidoPeloUsuario,
    AutorCardModel? usuarioMencionado,
    int? parentId,
  }) = _ComentarioResponseModel;

  factory ComentarioResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ComentarioResponseModelFromJson(json);
}

