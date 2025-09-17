part of '../../app_router.dart';


@TypedStatefulShellRoute<ShellAboutRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AboutUsRoute>(path: AppRoutes.aboutUs),
      ],
    ),
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AboutNapneRoute>(path: AppRoutes.aboutNapne),
      ],
    ),
  ],
)
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
