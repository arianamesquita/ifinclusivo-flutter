import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_routes.dart';
import 'package:if_inclusivo/ui/exceptions/forbidden_403.dart';
import 'package:if_inclusivo/ui/exceptions/not_found_404.dart';
import 'package:if_inclusivo/ui/pages/chat/chat/message_area.dart';
import 'package:if_inclusivo/ui/pages/chat/chat_page.dart';
import 'package:if_inclusivo/ui/pages/libras/modal_midia_page.dart';
import 'package:if_inclusivo/ui/pages/specific_topic/specific_topic_page.dart';

import '../ui/core/layout/custom_container_shell.dart';
import '../ui/exceptions/internal_server_error_500.dart';
import '../ui/exceptions/unauthorized_401.dart';
import '../ui/pages/auth/sign_in/Login_dialog_content.dart';
import '../ui/pages/auth/sing_up/register_dialog_content.dart';
import '../ui/pages/libras/page_libras.dart';
import '../ui/pages/presentation/aboult_us/about_us_page.dart';
import '../ui/pages/presentation/about_napne/about_napne_page.dart';
import '../ui/pages/presentation/presentation_page.dart';
import '../ui/pages/shell/shell_page.dart';
import '../utils/dialog_page.dart';

// gerador de rota único
part 'app_router.g.dart';

// Parts das rotas
part 'pages/app/routes/notification_router.dart';
part 'pages/about_routes/routes/about_napne_router.dart';
part 'pages/about_routes/routes/about_us_router.dart';
part 'pages/auth/routes/login_route.dart';
part 'pages/auth/routes/sign_up_route.dart';
part 'pages/app/routes/chat_router.dart';
part 'pages/app/routes/libras_routers/libras_router.dart';
part 'pages/app/routes/more_page_router.dart';
part 'pages/app/routes/topico_router.dart';
part 'pages/app/routes/profile_router.dart';
part 'pages/app/routes/forum_router.dart';
part 'pages/app/routes/libras_routers/midia_router.dart';
part 'pages/app/routes/libras_routers/redes_router.dart';
// part dos shells
part 'pages/app/shell_app_router.dart';
part 'pages/about_routes/shell_about_router.dart';
part 'pages/auth/shell_auth_router.dart';

part 'pages/exceptions/exceptions_routes.dart';

GoRouter createRouter() =>
    GoRouter(
        initialLocation: ForumRouter().location,
        errorBuilder: (context, state){
            return NotFound404();
        },
        routes: $appRoutes
    );
