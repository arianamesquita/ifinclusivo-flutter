import 'package:lucid_validation/lucid_validation.dart';

// 1. Um modelo simples que representa o dado que queremos validar.
class NameModel {
  final String name;
  NameModel({required this.name});
}

class NameFieldValidator extends LucidValidator<NameModel> {
  NameFieldValidator() {
    ruleFor((model) => model.name, key: 'name')
        .notEmpty(message: 'O nome não pode ser vazio.')
        .mustHaveUppercase(message: 'Utilize as maiúsculas e minúsculas corretamente')
        .must(
          (name) => RegExp(r'^[A-Za-zÀ-ÿ\s]+$').hasMatch(name),
      'O nome deve conter apenas letras e espaços.',
      'caracteres inválidos',
    );
  }
}
