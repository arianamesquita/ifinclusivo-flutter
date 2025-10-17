part of 'gen_requests.dart';

@freezed
class AlunoRequestModel with _$AlunoRequestModel {
  const factory AlunoRequestModel({
    required String nome,
    required String login,
    required String senha,
    required int matricula, // Long -> String
    @JsonKey(toJson: cursoToJson) required Cursos curso,
    String? biografia,
  }) = _AlunoRequestModel;

  factory AlunoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AlunoRequestModelFromJson(json);
}

String cursoToJson(Cursos curso) {
  switch (curso) {
    case Cursos.SISTEMAS_INFORMACAO:
      return 'SI';
    case Cursos.MEDIO_TECNICO_TI:
      return 'MEDIO_TECNICO_TI';
  }
}
@freezed
class AlunoNapneRequestModel with _$AlunoNapneRequestModel {
  const factory AlunoNapneRequestModel({
    required String nome,
    required String login,
    required String senha,
    required int matricula,
    String? biografia,
    required String condicao,
    required String laudo,
    required String necessidadeEspecial,
    required String necessidadeEscolar,
    required String acompanhamento,
    required String situacao,
  }) = _AlunoNapneRequestModel;

  factory AlunoNapneRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AlunoNapneRequestModelFromJson(json);
}

@freezed
class ProfessorRequestModel with _$ProfessorRequestModel {
  const factory ProfessorRequestModel({
    required String nome,
    required String login,
    required String senha,
    required int matricula,
    String? biografia,
    required String formacao,
  }) = _ProfessorRequestModel;

  factory ProfessorRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessorRequestModelFromJson(json);
}

@freezed
class TutorRequestModel with _$TutorRequestModel {
  const factory TutorRequestModel({
    required String nome,
    required String login,
    required String senha,
    required int matricula,
    String? biografia,
    required String especialidade,
  }) = _TutorRequestModel;

  factory TutorRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TutorRequestModelFromJson(json);
}

@freezed
class InterpreteRequestModel with _$InterpreteRequestModel {
  const factory InterpreteRequestModel({
    required String nome,
    required String login,
    required String senha,
    required int matricula,
    String? biografia,
    required String especialidade, // Campo do Tutor
    required double salary,
  }) = _InterpreteRequestModel;

  factory InterpreteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InterpreteRequestModelFromJson(json);
}