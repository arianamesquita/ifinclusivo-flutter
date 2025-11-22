part of '../../app_router.dart';

@TypedStatefulShellRoute<ShellAppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    forumBranch,
    librasBranch,
    moreBranch,
    profileBranch,
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
    return ShellPage(state: state,child: navigationShell,);
  }
}
