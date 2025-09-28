part of 'gen_simple_models.dart';

@freezed
class SimpleLibrasModel with _$SimpleLibrasModel {
  const factory SimpleLibrasModel({
    required String id,
    required String palavra,
    required Categorias categorias
  }) = _SimpleLibrasModel;

  factory SimpleLibrasModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleLibrasModelFromJson(json);
}