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
    @JsonKey(toJson: cursoToJson) required Cursos curso,
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

@freezed
class AlunoDetailsRequestModel with _$AlunoDetailsRequestModel {
  const factory AlunoDetailsRequestModel({
    required String nome,
    required int matricula, // Long -> String
    @JsonKey(toJson: cursoToJson) required Cursos curso,
    String? biografia,
  }) = _AlunoDetailsRequestModel;

  factory AlunoDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AlunoDetailsRequestModelFromJson(json);
}

@freezed
class AlunoNapneDetailsRequestModel with _$AlunoNapneDetailsRequestModel {
  const factory AlunoNapneDetailsRequestModel({
    required String nome,
    required int matricula,
    String? biografia,
    @JsonKey(toJson: cursoToJson) required Cursos curso,
    required String condicao,
    required String laudo,
    required String necessidadeEspecial,
    required String necessidadeEscolar,
    required String acompanhamento,
    required String situacao,
  }) = _AlunoNapneDetailsRequestModel;

  factory AlunoNapneDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AlunoNapneDetailsRequestModelFromJson(json);
}

@freezed
class ProfessorDetailsRequestModel with _$ProfessorDetailsRequestModel {
  const factory ProfessorDetailsRequestModel({
    required String nome,
    required int matricula,
    String? biografia,
    required String formacao,
  }) = _ProfessorDetailsRequestModel;

  factory ProfessorDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessorDetailsRequestModelFromJson(json);
}

@freezed
class TutorDetailsRequestModel with _$TutorDetailsRequestModel {
  const factory TutorDetailsRequestModel({
    required String nome,
    required int matricula,
    String? biografia,
    required String especialidade,
  }) = _TutorDetailsRequestModel;

  factory TutorDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TutorDetailsRequestModelFromJson(json);
}

@freezed
class InterpreteDetailsRequestModel with _$InterpreteDetailsRequestModel {
  const factory InterpreteDetailsRequestModel({
    required String nome,
    required int matricula,
    String? biografia,
    required String especialidade, // Campo do Tutor
    required double salary,
  }) = _InterpreteDetailsRequestModel;

  factory InterpreteDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InterpreteDetailsRequestModelFromJson(json);
}
