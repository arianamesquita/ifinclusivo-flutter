part of 'gen_requests.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String login,
    required String senha,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}

@freezed
class ForgotPasswordRequestModel with _$ForgotPasswordRequestModel {
  const factory ForgotPasswordRequestModel({
    required String email,
  }) = _ForgotPasswordRequestModel;

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestModelFromJson(json);
}

@freezed
class ResetPasswordRequestModel with _$ResetPasswordRequestModel {
  const factory ResetPasswordRequestModel({
    required String token,
    required String novaSenha,
  }) = _ResetPasswordRequestModel;

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);
}

@freezed
class UpdatePasswordRequestModel with _$UpdatePasswordRequestModel {
  const factory UpdatePasswordRequestModel({
    required String email,
    required String senhaAtual,
    required String novaSenha,
  }) = _UpdatePasswordRequestModel;

  factory UpdatePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestModelFromJson(json);
}