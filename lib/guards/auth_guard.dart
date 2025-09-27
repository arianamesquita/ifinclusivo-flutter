import 'package:if_inclusivo/guards/roles.dart';

import '../routing/app_routes.dart';

class AuthGuardShell{

  final bool isLoggedIn;
  final List<Roles> userRoles;

  AuthGuardShell({required this.isLoggedIn, required this.userRoles});

  List<int> allowedBranches() {
  final allowed = <int>[];
  if (canAccess(AppRoutes.forum, userRoles, isLoggedIn: isLoggedIn)) allowed.add(0);
  if (canAccess(AppRoutes.libras, userRoles, isLoggedIn: isLoggedIn)) allowed.add(1);
  if (canAccess(AppRoutes.more, userRoles, isLoggedIn: isLoggedIn)) allowed.add(2);
  if (canAccess(AppRoutes.profile, userRoles, isLoggedIn: isLoggedIn)) allowed.add(3);
  return allowed;
  }
  List<int> allowedBranchesMobile() {
  final allowed = <int>[];
  if (canAccess(AppRoutes.forum, userRoles, isLoggedIn: isLoggedIn)) allowed.add(0);
  if (canAccess(AppRoutes.libras, userRoles, isLoggedIn: isLoggedIn)) allowed.add(1);
  if (canAccess(AppRoutes.profile, userRoles, isLoggedIn: isLoggedIn)) allowed.add(2);
  return allowed;
  }

  int mapSelectedIndex(List<int> allowedBranches, int currentIndex) {
  return allowedBranches.indexOf(currentIndex);
  }

}