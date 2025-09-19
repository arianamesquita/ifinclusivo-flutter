import 'package:freezed_annotation/freezed_annotation.dart';

enum Categorias {
  @JsonValue(1)
  REDES(1),
  @JsonValue(2)
  BANCO_DE_DADOS(2),
  @JsonValue(3)
  PROGRAMACAO(3),
  @JsonValue(4)
  WEB(4),
  @JsonValue(5)
  ESTRUTURA_DE_DADOS(5),
  @JsonValue(6)
  ARQUITETURA_DE_COMPUTADORES(6);

  final int value;
  const Categorias(this.value);
}