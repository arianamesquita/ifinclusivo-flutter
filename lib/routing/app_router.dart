import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_napne_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_us_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/shell_about_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/chat_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/forum_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/libras_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/more_page_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/notification_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/profile_router.dart';
import 'package:if_inclusivo/routing/pages/app/routes/topico_router.dart';
import 'package:if_inclusivo/routing/pages/app/shell_app_router.dart';
import 'package:if_inclusivo/routing/pages/auth/routes/login_route.dart';
import 'package:if_inclusivo/routing/pages/auth/routes/sign_up_route.dart';
import 'package:if_inclusivo/routing/pages/auth/shell_auth_router.dart';

import 'app_routes.dart' show AppRoutes;

part 'app_router.g.dart';

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
    TypedGoRoute<NotificationRouter>(path: 'notification'),
  ],
)
class RootRouter extends GoRouteData with $RootRouter {
  const RootRouter();
}

GoRouter createRouter() => GoRouter(initialLocation: AboutUsRoute().location, routes: $appRoutes);
