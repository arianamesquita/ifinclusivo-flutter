part of 'gen_requests.dart';

@freezed
class CursoRequestModel with _$CursoRequestModel {
  const factory CursoRequestModel({
    required String nome,
  }) = _CursoRequestModel;

  factory CursoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CursoRequestModelFromJson(json);
}

@freezed
class ConfigAcblRequestModel with _$ConfigAcblRequestModel {
  const factory ConfigAcblRequestModel({
    String? audicao,
    required TemaCSS tema,
    String? zoom,
  }) = _ConfigAcblRequestModel;

  factory ConfigAcblRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigAcblRequestModelFromJson(json);
}

@freezed
class MessageRequestModel with _$MessageRequestModel {
  const factory MessageRequestModel({
    required String IdUserEnvia,
    required String IdUserRecebe,
    required String text,
  }) = _MessageRequestModel;

  factory MessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestModelFromJson(json);
}