import 'package:if_inclusivo/guards/roles.dart';

import '../routing/app_routes.dart';

class AuthGuardShell{

  final bool isLoggedIn;
  final List<Roles> userRoles;

  AuthGuardShell({required this.isLoggedIn, required this.userRoles});

  /// Quais branches (índices) o usuário pode acessar
  List<int> allowedBranches() {
  final allowed = <int>[];
  if (canAccess(AppRoutes.forum, userRoles, isLoggedIn: isLoggedIn)) allowed.add(0);
  if (canAccess(AppRoutes.libras, userRoles, isLoggedIn: isLoggedIn)) allowed.add(1);
  if (canAccess(AppRoutes.topico, userRoles, isLoggedIn: isLoggedIn)) allowed.add(2);
  if (canAccess(AppRoutes.chat, userRoles, isLoggedIn: isLoggedIn)) allowed.add(3);
  if (canAccess(AppRoutes.more, userRoles, isLoggedIn: isLoggedIn)) allowed.add(4);
  if (canAccess(AppRoutes.profile, userRoles, isLoggedIn: isLoggedIn)) allowed.add(5);
  return allowed;
  }
  List<int> allowedBranchesMobile() {
  final allowed = <int>[];
  if (canAccess(AppRoutes.forum, userRoles, isLoggedIn: isLoggedIn)) allowed.add(0);
  if (canAccess(AppRoutes.libras, userRoles, isLoggedIn: isLoggedIn)) allowed.add(2);
  if (canAccess(AppRoutes.topico, userRoles, isLoggedIn: isLoggedIn)) allowed.add(1);
  if (canAccess(AppRoutes.chat, userRoles, isLoggedIn: isLoggedIn)) allowed.add(3);
  if (canAccess(AppRoutes.profile, userRoles, isLoggedIn: isLoggedIn)) allowed.add(4);
  return allowed;
  }

  /// Traduz índice original do shell para índice filtrado
  int mapSelectedIndex(List<int> allowedBranches, int currentIndex) {
  return allowedBranches.indexOf(currentIndex);
  }



}