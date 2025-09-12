import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/pages/shell/shell_page.dart';
import '../../app_routes.dart';


class ShellAppRouter extends StatefulShellRouteData  {
  const ShellAppRouter();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) {
    return ShellPage(child: navigationShell);
  }
}
