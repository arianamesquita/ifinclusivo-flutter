
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_routes.dart';
import 'package:if_inclusivo/routing/pages/about_routes/shell_about_router.dart';
import 'package:if_inclusivo/routing/pages/app/shell_app_router.dart';
import 'package:if_inclusivo/routing/pages/auth/shell_auth_router.dart' hide DialogPage;

import '../ui/pages/auth/sign_in/Login_dialog_content.dart';
import '../ui/pages/auth/sing_up/register_dialog_content.dart';
import '../ui/pages/presentation/aboult_us/about_us_page.dart';
import '../ui/pages/presentation/about_napne/about_napne_page.dart';
import '../utils/dialog_page.dart';

// ---- Aqui entram os parts ----
part 'app_router.g.dart';
part 'pages/app/routes/notification_router.dart';
part 'pages/about_routes/routes/about_napne_router.dart';
part 'pages/about_routes/routes/about_us_router.dart';
part 'pages/auth/routes/login_route.dart';
part 'pages/auth/routes/sign_up_route.dart';
part 'pages/app/routes/chat_router.dart';
part 'pages/app/routes/libras_router.dart';
part 'pages/app/routes/more_page_router.dart';
part 'pages/app/routes/topico_router.dart';
part 'pages/app/routes/profile_router.dart';
part 'pages/app/routes/forum_router.dart';

@TypedGoRoute<RootRouter>(
  path: '/',
  routes: <TypedRoute<RouteData>>[
    TypedStatefulShellRoute<ShellAboutRoute>(
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
    ),
    TypedStatefulShellRoute<ShellAuthRoute>(
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
    ),
    TypedStatefulShellRoute<ShellAppRouter>(
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
    ),
    TypedGoRoute<NotificationRouter>(path: AppRoutes.notification),
  ],
)
class RootRouter extends GoRouteData with _$RootRouter {
  const RootRouter();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(child: Text('Root Page')),
    );
  }

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    return AboutUsRoute().location;
  }
}

GoRouter createRouter() => GoRouter(initialLocation: AboutUsRoute().location, routes: $appRoutes);
