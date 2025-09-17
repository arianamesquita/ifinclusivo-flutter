import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/exceptions/widgets/exceptions_code_page.dart';

class NotFound404 extends StatelessWidget {
  const NotFound404({super.key});

  @override
  Widget build(BuildContext context) {
    return ExceptionsCodePage(
      title: 'Página não encontrada',
      label: 'A página que você procura não existe ou foi movida.',
      svgPath: 'assets/exceptions/error-404-VAYaghxDVx.svg',
    );
  }
}
