import 'package:flutter/material.dart';
import 'package:if_inclusivo/guards/roles.dart';

class ChipValues {
  final String label;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final StadiumBorder? border;

  const ChipValues(this.label, this.textStyle, this.backgroundColor, this.border);
}

ChipValues getValuesByRole(Roles role, BuildContext context) {
  TextStyle? baseStyle = Theme.of(context)
      .textTheme
      .labelMedium
      ?.copyWith(fontWeight: FontWeight.bold);

  switch (role) {
    case Roles.ROLE_PROFESSOR:
      return ChipValues(
        "Professor",
        baseStyle?.copyWith(color: Color(0xFFDD6B20)),
        Color(0xFFFEEBC8),
        StadiumBorder(side: BorderSide(color: Color(0xFFFEEBC8), width: 1)),
      );
    case Roles.ROLE_TUTOR:
      return ChipValues(
        "Tutor",
        baseStyle?.copyWith(color: Color(0xFF718096)),
        Color.fromRGBO(97, 94, 240, 0.04),
        StadiumBorder(side: BorderSide(color: Color(0xFFCBD5E0), width: 1)),
      );
    case Roles.ROLE_ALUNO:
    case Roles.ROLE_ALUNO_NAPNE:
      return ChipValues(
        "Aluno",
        baseStyle?.copyWith(color: Color(0xFF38A169)),
        Color(0xFFC6F6D5),
        StadiumBorder(side: BorderSide(color: Color(0xFFC6F6D5), width: 1)),
      );
    case Roles.ROLE_INTERPRETE:
      return ChipValues(
        "Intérprete",
        baseStyle?.copyWith(color: Color(0xFF275C7C)),
        Color(0xFFC6F6D5),
        StadiumBorder(side: BorderSide(color: Color(0xFFC6F6D5), width: 1)),
      );
  }
}
