import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../../routing/app_router.dart';

class CustomContainerShell extends StatelessWidget {
  final Widget child;
  final bool showBackButton; // controle se botão aparece
  final bool alwaysActive; // se deve aparecer mesmo sem nada na pilha
  final VoidCallback? onBack; // callback customizável
  const CustomContainerShell({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.alwaysActive = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    bool web =
        (MediaQuery.of(context).size.height > 550) &&
        ResponsiveUtils.getDeviceType(context) == DeviceScreenType.desktop;
    final bool canShowBack =
        showBackButton && (alwaysActive || (GoRouter.of(context).canPop() && !GoRouter.of(
          context,
        ).state.uri.path.startsWith(NotificationRouter().location)) );

    return web
        ? SizedBox.expand(
          child: Stack(
          children: [
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // centraliza verticalmente
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/figuras decorativas.svg",
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 200),
                  ],
                ),
                Expanded(child: SingleChildScrollView(child:ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: child))),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 200),
                    SvgPicture.asset(
                      "assets/icons/figuras decorativas-1.svg",
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
            if (canShowBack)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 35, left: web ? 20 : 5),
                  child: buildElevatedButton(context),
                ),
              ),
          ],
                      ),
                )
        : SingleChildScrollView(child: Column(
          children: [
            if (canShowBack) buildElevatedButton(context),
            child,
          ],
        ));
  }

  Widget buildElevatedButton(BuildContext context) {
    return Tooltip(
        message: 'Voltar à página anterior',
        child: ElevatedButton.icon(
                        onPressed:
                            onBack ??
                            () {
                              if (GoRouter.of(context).canPop()) {
                                GoRouter.of(context).pop();
                              }
                            },
                        label: Text('voltar'),
                        icon: Icon(Icons.logout_rounded, size: 24),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.inverseSurface,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                      ));
  }
}
