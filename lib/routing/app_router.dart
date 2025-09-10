
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_napne_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_us_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/shell_about_router.dart';
import 'package:if_inclusivo/routing/pages/app/shell_app_router.dart';
import 'package:if_inclusivo/routing/pages/auth/shell_auth_router.dart';

GoRouter createRouter() => GoRouter(
  initialLocation: AboutNapneRoute().location,
  routes: [
    $shellAboutRoute,
    $shellAuthRoute,
    $shellAppRouter
  ],
);