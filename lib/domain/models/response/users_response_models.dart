part of 'gen_responses.dart';

@freezed
class UsuarioResponseModel with _$UsuarioResponseModel {

  const factory UsuarioResponseModel.aluno({
    required String id,
    required String nome,
    required String login,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required ConfigAcblResponseModel configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    required CursoRequestModel curso,
  }) = _AlunoResponseModel;

  const factory UsuarioResponseModel.alunoNapne({
    required String id,
    required String nome,
    required String login,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required ConfigAcblResponseModel configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
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
    required String id,
    required String nome,
    required String login,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required ConfigAcblResponseModel configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    required String formacao,
    required List<SimpleTopicoModel> topicos,
  }) = _ProfessorResponseModel;

  const factory UsuarioResponseModel.tutor({
    required String id,
    required String nome,
    required String login,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required ConfigAcblResponseModel configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    required String especialidade,
  }) = _TutorResponseModel;

  const factory UsuarioResponseModel.interprete({
    required String id,
    required String nome,
    required String login,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required ConfigAcblResponseModel configAcessibilidadeEntity,
    required List<Roles> roles,
    String? token,
    required String especialidade,
    required double salary,
    required List<SimpleLibrasModel> libras,
  }) = _InterpreteResponseModel;

  factory UsuarioResponseModel.fromJson(Map<String, dynamic> json) => _$UsuarioResponseModelFromJson(json);
}