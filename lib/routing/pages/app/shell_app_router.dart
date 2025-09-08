import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/chat_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/forum_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/libras_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/topico_router.dart';
import 'package:if_inclusivo/ui/pages/shell/shell_page.dart';

import '../../app_routes.dart';

part 'shell_app_router.g.dart';

@TypedStatefulShellRoute<ShellAppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ForumRouter>(path: AppRoutes.forum),
      ],
    ),
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LibrasRouter>(path: AppRoutes.libras),
      ],
    ),
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<TopicoRouter>(path: AppRoutes.topico),
      ],
    ),
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ChatRouter>(path: AppRoutes.chat),
      ],
    ),
  ],
)
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
