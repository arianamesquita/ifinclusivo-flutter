import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModel.freezed.dart';
part 'userModel.g.dart';

@freezed
class UserModel with _$UserModel{
  // Forçar a atualização
  const factory UserModel({
    required String id,
    required String nome,
    required String matricula,
    required String login,
    required String senha,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}