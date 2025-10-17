import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_routes.dart';
import 'package:if_inclusivo/ui/exceptions/forbidden_403.dart';
import 'package:if_inclusivo/ui/exceptions/not_found_404.dart';
import 'package:if_inclusivo/ui/pages/auth/reset_password/reset_password_page.dart';
import 'package:if_inclusivo/ui/pages/auth/token/token_page.dart';
import 'package:if_inclusivo/ui/pages/libras/midia_page.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/specific_topic_page.dart';
import 'package:if_inclusivo/ui/pages/profile/account_security/account_security_page.dart';
import 'package:if_inclusivo/ui/pages/profile/profile_page.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository.dart';
import '../domain/models/enums/categorias.dart';
import '../guards/router_guard.dart';
import '../ui/core/layout/custom_container_shell.dart';
import '../ui/exceptions/internal_server_error_500.dart';
import '../ui/exceptions/unauthorized_401.dart';
import '../ui/pages/auth/sign_in/Login_dialog_content.dart';
import '../ui/pages/auth/sing_up/register_dialog_content.dart';
import '../ui/pages/forum/feed/feed_page.dart';
import '../ui/pages/forum/new publication/publication_editor.dart';
import '../ui/pages/forum/publicacao/publicacao_page.dart';
import '../ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import '../ui/pages/libras/page_libras.dart';
import '../ui/pages/presentation/aboult_us/about_us_page.dart';
import '../ui/pages/presentation/about_napne/about_napne_page.dart';
import '../ui/pages/presentation/presentation_page.dart';
import '../ui/pages/shell/shell_page.dart';
import '../utils/dialog_page.dart';
import '../utils/stream_listenable.dart';

// gerador de rota único
part 'app_router.g.dart';

// Parts das rotas
part 'pages/app/routes/notification_router.dart';
part 'pages/about_routes/routes/about_napne_router.dart';
part 'pages/about_routes/routes/about_us_router.dart';
part 'pages/auth/routes/login_route.dart';
part 'pages/auth/routes/sign_up_route.dart';
part 'pages/app/routes/libras_router.dart';
part 'pages/app/routes/more_page_router.dart';
part 'pages/app/routes/profile_router.dart';
part 'pages/app/routes/forum_router.dart';
part 'pages/auth/routes/token_validate_router.dart';
part 'pages/auth/routes/reset_password_route.dart';

// part dos shells
part 'pages/app/shell_app_router.dart';
part 'pages/about_routes/shell_about_router.dart';

part 'pages/exceptions/exceptions_routes.dart';


GoRouter createRouter({required AuthRepository authRepository}) {
  final authListenable = StreamListenable(authRepository.authStateChanges);
  return GoRouter(
    refreshListenable: authListenable,
    initialLocation: AppRoutes.aboutUs,
    errorBuilder: (context, state) {
      return const NotFound404();
    },
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = authRepository.currentUser != null;
      final String location = state.matchedLocation;
      final isAuthRoute =
          location == AppRoutes.signIn || location == AppRoutes.signUp;
      if (!loggedIn && !isPublicRoute(location)) {
        AuthRedirectHelper.setRedirectLocation(location);
        return AppRoutes.signIn;
      }

      return null;
    },
    routes: $appRoutes,
  );
}

class AuthRedirectHelper {
  static String? _redirectLocation;

  static String? get redirectLocation => _redirectLocation;

  static void setRedirectLocation(String location) {
    _redirectLocation = location;
  }

  static void clearRedirectLocation() {
    _redirectLocation = null;
  }
}
