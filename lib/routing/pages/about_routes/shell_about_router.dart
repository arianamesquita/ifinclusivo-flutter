import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../ui/pages/presentation/presentation_page.dart';



class ShellAboutRoute extends StatefulShellRouteData  {
  const ShellAboutRoute();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) {
    return PresentationPage(child: navigationShell);
  }
}
