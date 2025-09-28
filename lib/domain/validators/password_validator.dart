
import 'package:lucid_validation/lucid_validation.dart';

class PasswordModel {
  final String password;
  PasswordModel({required this.password});
}


class PasswordFieldValidator extends LucidValidator<PasswordModel> {
  PasswordFieldValidator() {
    ruleFor((model) => model.password, key: 'senha')
        .notEmpty(message: 'O senha não pode ser vazia.')
        .minLength(6, message: 'A senha deve conter no mínimo 6 caracteres');
  }
}