import 'package:if_inclusivo/guards/roles.dart';

import '../routing/app_routes.dart';

bool isPublicRoute(String route) {
  return AppRoutes.routes.any((r) => r.isPublic && r.matches(route));
}

bool canAccess(
    String route,
    List<Roles> userRoles, {
      bool isLoggedIn = false,
    }) {
  final appRoute = AppRoutes.routes.firstWhere(
        (r) => r.matches(route),
    orElse: () => AppRoute(path: route, isPublic: false),
  );

  if (appRoute.isPublic) return true;
  if (!isLoggedIn) return false;
  if (appRoute.allowedRoles.isEmpty) return false;
  return userRoles.any((role) => appRoute.allowedRoles.contains(role));
}
