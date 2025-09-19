part of 'gen_responses.dart';


@freezed
class TopicoResponseModel with _$TopicoResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory TopicoResponseModel({
    required String id,
    required String titulo,
    required String descricao,
    required Categorias categoria,
    required DateTime dataCriacao,
    required SimpleUsuarioModel professor, // Usando a union SimpleUsuarioModel
    required List<SimplePublicacaoModel> publicacoes,
  }) = _TopicoResponseModel;

  factory TopicoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopicoResponseModelFromJson(json);
}

@freezed
class PublicacaoResponseModel with _$PublicacaoResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoResponseModel({
    required String id,
    required String titulo,
    required String text,
    String? urlVideo,
    String? urlFoto,
    required DateTime dataCriacao,
    required SimpleUsuarioModel usuario,
    required SimpleTopicoModel topico,
    required List<SimpleComentarioModel> comentarios,
    required List<SimpleUsuarioModel> likeBy,
  }) = _PublicacaoResponseModel;

  factory PublicacaoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoResponseModelFromJson(json);
}

@freezed
class ComentarioResponseModel with _$ComentarioResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory ComentarioResponseModel({
    required String id,
    required SimpleUsuarioModel usuario,
    required String content,
    required DateTime dataCriacao,
    SimpleComentarioModel? comentarioPai,

    // Mapeia o getter `getQuantidadeComentariosfilhos` para um campo
    @JsonKey(name: 'quantidadeComentariosfilhos')
    required int quantidadeComentariosFilhos,

    // Mapeia o getter `getQuantidadeUseFulBy` para um campo
    @JsonKey(name: 'quantidadeUseFulBy')
    required int quantidadeUseFulBy,

    // Ignora campos que não devem ser parseados do JSON
    @JsonKey(includeFromJson: false, includeToJson: false)
    SimplePublicacaoModel? publicacao,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<SimpleComentarioModel>? comentariosFilhos,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<SimpleUsuarioModel>? usefulBy,

  }) = _ComentarioResponseModel;

  factory ComentarioResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ComentarioResponseModelFromJson(json);
}