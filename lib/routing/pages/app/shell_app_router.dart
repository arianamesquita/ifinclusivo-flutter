part of '../../app_router.dart';

@TypedStatefulShellRoute<ShellAppRouter>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    forumBranch,
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LibrasRouter>(
          path: AppRoutes.libras,
          routes: [
            TypedGoRoute<RedesRouter>(
              path: AppRoutes.publicacoesPorTopico,
              routes: [TypedGoRoute<MidiaRouter>(path: AppRoutes.midia)],
            ),
          ],
        ),
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
    newPublicationBranch
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
