
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_us_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/shell_about_router.dart';

GoRouter createRouter() => GoRouter(
  initialLocation: AboutUsRoute().location,
  routes: [
    $shellAboutRoute,
  ],
);