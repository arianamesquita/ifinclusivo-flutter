import 'package:lucid_validation/lucid_validation.dart';

// 1. Um modelo simples que representa o dado que queremos validar.
class EmailModel {
  final String email;
  EmailModel({required this.email});
}


class EmailFieldValidator extends LucidValidator<EmailModel> {
  EmailFieldValidator() {
    ruleFor((model) => model.email, key: 'email')
        .notEmpty(message: 'O e-mail não pode ser vazio.')
        .validEmail(message: 'Por favor, insira um e-mail válido.');
  }
}