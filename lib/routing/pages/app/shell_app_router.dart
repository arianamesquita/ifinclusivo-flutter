part of '../../app_router.dart';


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
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<MorePageRouter>(path: AppRoutes.more),
      ],
    ),

    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRouter>(path: AppRoutes.profile),
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
