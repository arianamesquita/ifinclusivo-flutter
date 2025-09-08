import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_us_router.dart';

import '../../../ui/pages/presentation/presentation_page.dart';

import '../../app_routes.dart';
import 'routes/about_napne_router.dart';

part 'shell_about_router.g.dart';

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
