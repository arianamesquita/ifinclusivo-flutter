import 'package:lucid_validation/lucid_validation.dart';

// 1. Um modelo simples que representa o dado que queremos validar.
class CursoModel {
  final String curso;
  CursoModel({required this.curso});
}

class CursoFieldValidator extends LucidValidator<CursoModel> {
  CursoFieldValidator() {
    ruleFor((model) => model.curso, key: 'curso')
        .notEmpty(message: 'O nome não pode ser vazio.')
        .mustHaveUppercase(message: 'Utilize as maiúsculas e minúsculas corretamente')
        .must(
          (name) => RegExp(r'^[A-Za-zÀ-ÿ\s]+$').hasMatch(name),
      'O nome deve conter apenas letras e espaços.',
      'caracteres inválidos',
    );
  }
}
