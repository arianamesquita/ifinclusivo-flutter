part of 'gen_requests.dart';

@freezed
class TopicoRequestModel with _$TopicoRequestModel {
  const factory TopicoRequestModel({
    required String titulo,
    required String descricao,
    required Categorias categoria,
  }) = _TopicoRequestModel;

  factory TopicoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TopicoRequestModelFromJson(json);
}

@freezed
class PublicacaoRequestModel with _$PublicacaoRequestModel {
  const factory PublicacaoRequestModel({
    required String titulo,
    required String text,
    String? urlVideo,
    String? urlFoto,
  }) = _PublicacaoRequestModel;

  factory PublicacaoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoRequestModelFromJson(json);
}

@freezed
class ComentarioRequestModel with _$ComentarioRequestModel {
  const factory ComentarioRequestModel({
    required String content,
  }) = _ComentarioRequestModel;

  factory ComentarioRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ComentarioRequestModelFromJson(json);
}