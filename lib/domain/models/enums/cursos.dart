import 'package:freezed_annotation/freezed_annotation.dart';

enum Cursos {
  @JsonValue('SI')
  SI,
  @JsonValue('CIENCIA_COMPUTACAO')
  CIENCIA_COMPUTACAO,
  @JsonValue('ENGENHARIA_DE_SOFTWARE')
  ENGENHARIA_DE_SOFTWARE,
  @JsonValue('TADS')
  TADS,
}