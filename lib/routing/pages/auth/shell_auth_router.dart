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

    return _DialogPage(
      key: state.pageKey,
      child: Dialog.fullscreen(
        child: Center(
          child: navigationShell,
        ),
      ),
    );
  }
}

class _DialogPage extends CustomTransitionPage<void> {
  _DialogPage({required super.child, super.key})
    : super(
        barrierDismissible: true,
        barrierColor: Colors.black54,
        opaque: false,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
      );
}
