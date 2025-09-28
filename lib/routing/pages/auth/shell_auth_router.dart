part of '../../app_router.dart';


@TypedStatefulShellRoute<ShellAuthRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LoginRoute>(path: AppRoutes.signIn),
      ],
    ),
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<RegisterRoute>(path: AppRoutes.signUp),
      ],
    ),
  ],
)
class ShellAuthRoute extends StatefulShellRouteData {
  const ShellAuthRoute();

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {

    return MaterialPage<void>(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: navigationShell,
        ),
      ),
    );
  }
}
