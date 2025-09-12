import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
