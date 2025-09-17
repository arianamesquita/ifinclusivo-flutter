part of 'gen_simple_models.dart';

@freezed
class SimpleMessageModel with _$SimpleMessageModel {
  const factory SimpleMessageModel({
    required String id,
    required String text,
  }) = _SimpleMessageModel;

  factory SimpleMessageModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleMessageModelFromJson(json);
}