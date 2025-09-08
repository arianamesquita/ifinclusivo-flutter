import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/auth/routes/login_route.dart';
import 'package:if_inclusivo/routing/pages/auth/routes/sign_up_route.dart';

import '../../app_routes.dart';


part 'shell_auth_router.g.dart';

@TypedStatefulShellRoute<ShellAuthRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<LoginRoute>(path: AppRoutes.signIn)],
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

    return DialogPage(
      key: state.pageKey,
      child: Dialog(
        insetPadding: const EdgeInsets.all(50), // margem mínima da tela
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // opcional
          child: navigationShell,
        ),
      ),
    );
  }
}

class DialogPage extends CustomTransitionPage<void> {
  DialogPage({required super.child, super.key})
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
