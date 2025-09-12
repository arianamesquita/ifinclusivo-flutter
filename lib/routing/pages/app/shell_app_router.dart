import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/chat_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/forum_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/libras_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/more_page_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/profile_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/topico_router.dart';
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
