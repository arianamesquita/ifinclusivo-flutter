
import 'package:lucid_validation/lucid_validation.dart';

class LoginModel {
  final String email;
  final String password;
  LoginModel({this.email = '', this.password = ''});
}


class LoginFieldValidator extends LucidValidator<LoginModel> {
  LoginFieldValidator() {
    ruleFor((model) => model.email, key: 'email')
        .notEmpty(message: 'O e-mail não pode ser vazio.')
        .validEmail(message: 'Por favor, insira um e-mail válido.');
    ruleFor((model) => model.password, key: 'senha')
        .notEmpty(message: 'O senha não pode ser vazia.')
        .minLength(6, message: 'A senha deve conter no mínimo 6 caracteres');
  }
}