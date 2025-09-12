import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModel.freezed.dart';
part 'userModel.g.dart';

@freezed
class UserModel with _$UserModel{
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