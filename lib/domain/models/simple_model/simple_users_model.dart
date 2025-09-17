part of 'gen_simple_models.dart';

@Freezed(unionKey: 'roles')
class SimpleUsuarioModel with _$SimpleUsuarioModel {

  // Caso base
  const factory SimpleUsuarioModel.usuario({
    required String id,
    required String nome,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
  }) = _SimpleUsuarioModelUsuario;

  // Tipos específicos
  const factory SimpleUsuarioModel.tutor({
    required String id,
    required String nome,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required String especialidade,
  }) = _SimpleTutorModel;

  const factory SimpleUsuarioModel.professor({
    required String id,
    required String nome,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required String formacao,
  }) = _SimpleProfessorModel;

  const factory SimpleUsuarioModel.aluno({
    required String id,
    required String nome,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required CursoRequestModel curso,
  }) = _SimpleAlunoModel;

  const factory SimpleUsuarioModel.alunoNapne({
    required String id,
    required String nome,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required CursoRequestModel curso,
    required String condicao,
    required String necessidadeEspecial,
    required String necessidadeEscolar,
  }) = _SimpleAlunoNapneModel;

  const factory SimpleUsuarioModel.interprete({
    required String id,
    required String nome,
    required String matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required String especialidade,
    required double salary,
  }) = _SimpleInterpreteModel;


  factory SimpleUsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleUsuarioModelFromJson(json);
}