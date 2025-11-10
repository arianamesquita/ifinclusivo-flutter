part of 'gen_simple_models.dart';

@Freezed(unionKey: 'userType')
class SimpleUsuarioModel with _$SimpleUsuarioModel {

  // Caso base
  const factory SimpleUsuarioModel.usuario({
    required int id,
    required String nome,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
  }) = _SimpleUsuarioModelUsuario;

  // Tipos específicos
  const factory SimpleUsuarioModel.tutor({
    required int id,
    required String nome,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required String? especialidade,
  }) = _SimpleTutorModel;

  const factory SimpleUsuarioModel.professor({
    required int id,
    required String nome,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required String formacao,
  }) = _SimpleProfessorModel;

  const factory SimpleUsuarioModel.aluno({
    required int id,
    required String nome,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required Cursos curso,
  }) = _SimpleAlunoModel;

  const factory SimpleUsuarioModel.alunoNapne({
    required int id,
    required String nome,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required Cursos curso,
    required String condicao,
    required String necessidadeEspecial,
    required String necessidadeEscolar,
  }) = _SimpleAlunoNapneModel;

  const factory SimpleUsuarioModel.interprete({
    required int id,
    required String nome,
    required int matricula,
    String? biografia,
    required DateTime dataCriacao,
    required List<Roles> roles,
    required String? especialidade,
    required double salary,
  }) = _SimpleInterpreteModel;


  factory SimpleUsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleUsuarioModelFromJson(json);}