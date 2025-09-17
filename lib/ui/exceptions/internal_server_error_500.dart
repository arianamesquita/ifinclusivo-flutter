import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/exceptions/widgets/exceptions_code_page.dart';

class InternalServerError500 extends StatelessWidget {
  const InternalServerError500({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExceptionsCodePage(
      title: 'Erro interno no servidor',
      label: 'Ocorreu um erro inesperado. Tente novamente mais tarde.',
      svgPath: 'assets/exceptions/500 Internal Server Error-amico 1.svg',
    );
  }
}
