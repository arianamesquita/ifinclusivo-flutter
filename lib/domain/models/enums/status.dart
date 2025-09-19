import 'package:freezed_annotation/freezed_annotation.dart';

enum Status{
  @JsonValue(1)
  APROVADO(1),
  @JsonValue(2)
  REPROVADO(2),
  @JsonValue(3)
  EMANALISE(3);

  final int value;
  const Status(this.value);
}