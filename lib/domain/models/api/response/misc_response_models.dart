part of 'gen_responses.dart';

@freezed
class CursoResponseModel with _$CursoResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory CursoResponseModel({
    required String id,
    required String nome,
    required List<SimpleUsuarioModel> alunos, // Union garantirá que sejam Alunos
  }) = _CursoResponseModel;

  factory CursoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CursoResponseModelFromJson(json);
}

@freezed
class ConfigAcblResponseModel with _$ConfigAcblResponseModel {
  const factory ConfigAcblResponseModel({
    required String id,
    String? audicao,
    required TemaCSS tema,
    String? zoom,
  }) = _ConfigAcblResponseModel;

  factory ConfigAcblResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigAcblResponseModelFromJson(json);
}