import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/exceptions/widgets/exceptions_code_page.dart';

class Forbidden403 extends StatelessWidget {
  const Forbidden403({super.key});

  @override
  Widget build(BuildContext context) {
    return ExceptionsCodePage(
      title: 'Acesso não autorizado',
      label:
          'Você não tem permissão para acessar esta página. Tente fazer login novamente.',
      svgPath: 'assets/exceptions/403 Error Forbidden-cuate 1.svg',
    );
  }
}
