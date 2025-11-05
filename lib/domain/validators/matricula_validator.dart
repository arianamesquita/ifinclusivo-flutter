import 'package:lucid_validation/lucid_validation.dart';

class MatriculaModel {
  final String matricula;
  MatriculaModel({required this.matricula});
}

class MatriculaFieldValidator extends LucidValidator<MatriculaModel> {
  MatriculaFieldValidator() {
    ruleFor((model) => model.matricula, key: 'matricula')
        .must(
          (value) => RegExp(r'^[0-9]+$').hasMatch(value),
      'A matrícula deve conter apenas números',
      'only_numbers',
    );
  }
}