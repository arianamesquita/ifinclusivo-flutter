part of 'gen_requests.dart';



@freezed
class ComentarioRequestModel with _$ComentarioRequestModel{
  const factory ComentarioRequestModel({
    required String texto,
    int? parentId,
    int? usuarioMencionadoId,

}) = _ComentarioRequestModel;
  factory ComentarioRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ComentarioRequestModelFromJson(json);
}

@freezed
class PublicacaoRequestModel with _$PublicacaoRequestModel {
  // Use @JsonSerializable para lidar com enums e objetos aninhados
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoRequestModel({
    required String titulo,
    required String texto,
    @JsonKey(toJson: _categoriasToJson, fromJson: _categoriasFromJson)
    required Set<Categorias> categorias,
    @JsonKey(toJson: _tipoPublicacaoToJson, fromJson: _tipoPublicacaoFromJson)
    required TipoPublicacao tipo,
  }) = _PublicacaoRequestModel;

  factory PublicacaoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PublicacaoRequestModelFromJson(json);
}

List<String> _categoriasToJson(Set<Categorias> categorias) {
  return categorias.map((e) => e.name).toList();
}

Set<Categorias> _categoriasFromJson(List<dynamic> json) {
  return json.map((e) => Categorias.values.byName(e.toString())).toSet();
}

String _tipoPublicacaoToJson(TipoPublicacao tipo) => tipo.name;
TipoPublicacao _tipoPublicacaoFromJson(dynamic tipo) =>
    TipoPublicacao.values.byName(tipo.toString());
