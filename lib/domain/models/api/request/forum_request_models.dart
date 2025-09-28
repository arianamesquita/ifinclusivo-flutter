part of 'gen_requests.dart';

@freezed
class PublicacaoRequestModel  with _$PublicacaoRequestModel  {
  // Use @JsonSerializable para lidar com enums e objetos aninhados
  @JsonSerializable(explicitToJson: true)
  const factory PublicacaoRequestModel ({
    required String titulo,
    required String texto,
    @JsonKey(
      toJson: _categoriasToJson,
      fromJson: _categoriasFromJson,
    )
    required Set<Categorias> categorias,
    required int? parentId,
  }) = _PublicacaoRequestModel;

  factory PublicacaoRequestModel .fromJson(Map<String, dynamic> json) =>
      _$PublicacaoRequestModelFromJson(json);
}

List<String> _categoriasToJson(Set<Categorias> categorias) {
  return categorias.map((e) => e.name).toList();
}

Set<Categorias> _categoriasFromJson(List<dynamic> json) {
  return json.map((e) => Categorias.values.byName(e.toString())).toSet();
}