import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/exceptions/widgets/exceptions_code_page.dart';

class Unauthorized401 extends StatelessWidget {
  const Unauthorized401({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExceptionsCodePage(
      title: 'Acesso não autorizado',
      label:
          'Você não tem permissão para acessar esta página. Tente fazer login novamente.',
      svgPath: 'assets/exceptions/401 Error Unauthorized-amico 2.svg',
    );
  }
}
