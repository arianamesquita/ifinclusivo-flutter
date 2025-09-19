import 'package:freezed_annotation/freezed_annotation.dart';

enum TemaCSS{
  @JsonValue(1)
  TEMA1(1),
  @JsonValue(2)
  TEMA2(2),
  @JsonValue(3)
  TEMA3(3);

   final int value;
  const TemaCSS(this.value);
}