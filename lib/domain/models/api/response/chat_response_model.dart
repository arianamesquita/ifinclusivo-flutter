part of 'gen_responses.dart';

@freezed
class MessageResponseModel with _$MessageResponseModel {
  @JsonSerializable(explicitToJson: true)
  const factory MessageResponseModel({
    required String id,
    required String text,
    required DateTime dataCriacao,
    required bool visualizado,
    required SimpleUsuarioModel userEnvia,
    required SimpleUsuarioModel userRecebe,
  }) = _MessageResponseModel;

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);
}