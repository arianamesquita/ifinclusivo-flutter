part of '../../app_router.dart';

@TypedStatefulShellRoute<ShellAppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    forumBranch,
    librasBranch,
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
class ShellAppRouter extends StatefulShellRouteData {
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
