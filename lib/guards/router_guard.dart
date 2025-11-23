import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/guards/roles.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository.dart';
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



abstract class ProtectedRouteData extends GoRouteData {
  const ProtectedRouteData();
  List<Roles> get allowedRoles;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (allowedRoles.isEmpty) {
      return RouteGuards.ensureLoggedIn(context, state);
    }

    return RouteGuards.ensureRole(
      context,
      state,
      allowedRoles.toList(),
    );
  }
}

class RouteGuards {
  static FutureOr<String?> ensureLoggedIn(
      BuildContext context,
      GoRouterState state
      ) {
    final authRepository = context.read<AuthRepository>();
    final loggedIn = authRepository.currentUser != null;

    if (!loggedIn) {
      return '/login?from=${Uri.encodeComponent(state.uri.toString())}';
    }
    return null;
  }
  static FutureOr<String?> ensureRole(
      BuildContext context,
      GoRouterState state,
      List<Roles> allowedRoles
      ) {
    final loginRedirect = ensureLoggedIn(context, state);
    if (loginRedirect != null) return loginRedirect;

    final user = context.read<AuthRepository>().currentUser!;
    final hasRole = allowedRoles.any((role) => user.roles.contains(role));

    if (!hasRole) {
      return ForbiddenRoute().location;
    }

    return null;
  }
}

