import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/responsive_utils.dart';
import '../../../../core/layout/custom_container_shell.dart';
import '../../libras_details/widgets/top_content_libras.dart';

class SentSuggestionPage extends StatelessWidget {
  const SentSuggestionPage({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;

    return isMobile?
        Scaffold(
          appBar: AppBar(title: Text('Sugerir uma nova palavra'),),
          body: SafeArea(child: _buidbody(context)),
        ):
    CustomContainerShell(
      child: _buidbody(context),
    );
  }

  SingleChildScrollView _buidbody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TopContentLibras(
                title: "CONVERTE LIBRAS",
              ),
            ),
            Image.asset(
              "assets/icons/check.png",
            ),
            const SizedBox(height: 50),
            Text(
              "Sugestão enviada com sucesso!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Agradecemos sua contribuição!",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              "Nossa equipe irá analisar a sua sugestão em breve.",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 20,
              spacing: 32,
              children: [
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF529F85),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sugerir outra palavra",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFAC82BA),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Voltar para a busca",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
