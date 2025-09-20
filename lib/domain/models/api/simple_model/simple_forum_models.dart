part of 'gen_simple_models.dart';

@freezed
class SimpleTopicoModel with _$SimpleTopicoModel {
  const factory SimpleTopicoModel({
    required String id,
    required String titulo,
    required String descricao,
    required DateTime dataCriacao,
    required SimpleUsuarioModel professor

  }) = _SimpleTopicoModel;

  factory SimpleTopicoModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleTopicoModelFromJson(json);
}

@freezed
class SimplePublicacaoModel with _$SimplePublicacaoModel {
  const factory SimplePublicacaoModel({
    required String id,
    required String titulo,
    required String text,
    String? urlVideo,
    String? urlFoto,
    required DateTime dataCriacao,
    required SimpleUsuarioModel usuario,
  }) = _SimplePublicacaoModel;

  factory SimplePublicacaoModel.fromJson(Map<String, dynamic> json) =>
      _$SimplePublicacaoModelFromJson(json);
}
@freezed
class SimpleComentarioModel with _$SimpleComentarioModel {
  const factory SimpleComentarioModel({
    required String id,
    required String content,
    required DateTime dataCriacao,
  }) = _SimpleComentarioModel;

  factory SimpleComentarioModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleComentarioModelFromJson(json);
}