part of 'gen_responses.dart';

@Freezed(unionKey: 'userType')
class UsuarioResponseModel with _$UsuarioResponseModel {

  const factory UsuarioResponseModel.aluno({
    required int id,
    required String nome,
    required String imgPerfil,
    required String login,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    String? firebaseToken,
    required CursoRequestModel curso,
  }) = _AlunoResponseModel;

  const factory UsuarioResponseModel.alunoNapne({
    required int id,
    required String nome,
    required String imgPerfil,
    required String login,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    String? firebaseToken,
    required CursoRequestModel curso,
    required String condicao,
    required String laudo,
    required String necessidadeEspecial,
    required String necessidadeEscolar,
    required String acompanhamento,
    required String situacao,
  }) = _AlunoNapneResponseModel;

  // --- Caso 3: Professor ---
  const factory UsuarioResponseModel.professor({
    required int id,
    required String nome,
    required String imgPerfil,

    required String login,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    String? firebaseToken,
    required String formacao,
  }) = _ProfessorResponseModel;

  const factory UsuarioResponseModel.tutor({
    required int id,
    required String nome,
    required String imgPerfil,

    required String login,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    String? firebaseToken,
    required String? especialidade,
  }) = _TutorResponseModel;

  const factory UsuarioResponseModel.interprete({
    required int id,
    required String nome,
    required String imgPerfil,

    required String login,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    ConfigAcblResponseModel? configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    String? firebaseToken,
    required String? especialidade,
    required double salary,
    required List<SimpleLibrasModel> libras,
  }) = _InterpreteResponseModel;

  factory UsuarioResponseModel.fromJson(Map<String, dynamic> json) => _$UsuarioResponseModelFromJson(json);
}