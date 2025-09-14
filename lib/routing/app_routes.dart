import 'package:if_inclusivo/guards/roles.dart';

class AppRoutes {
  // Rotas da Seção de Apresentação
  static const String aboutUs = '/presentation';
  static const String aboutNapne = '$aboutUs/about-napne';
  // Rotas de autenticação
  static const String signIn = '/login';
  static const String signUp = '/register';

  // Rotas da Aplicação Principal
  static const String _app = '/app';
  static const String forum = '$_app/forum';
  static const String libras = '$_app/libras';
  static const String topico = '$_app/topicos';
  static const String chat = '$_app/chat';
  static const String more = '$_app/more';
  static const String notification = '$_app/notification';
  static const String profile = '$_app/profile';

  // Permissões de acesso por rota
  static final Map<String, List<Roles>> permissions = {
    forum: Roles.values,
    libras: Roles.values,
    notification: Roles.values,
    topico: Roles.values,
    chat: [
      Roles.ROLE_ALUNO_NAPNE,
      Roles.ROLE_INTERPRETE,
      Roles.ROLE_PROFESSOR,
      Roles.ROLE_TUTOR,
    ],
    more: [Roles.ROLE_INTERPRETE, Roles.ROLE_TUTOR],
    profile: Roles.values,
  };

  static final Set<String> publicRoutes = {
    aboutUs,
    aboutNapne,
    signIn,
    signUp,
    forum,
    libras,
    topico,
  };
}

bool isPublicRoute(String route) {
  return AppRoutes.publicRoutes.contains(route);
}

bool canAccess(
  String route,
  List<Roles> userRoles, {
  bool isLoggedIn = false,
}) {
  if (isPublicRoute(route)) return true;
  if (!isLoggedIn) return false;

  final allowedRoles = AppRoutes.permissions[route] ?? [];
  return userRoles.any((role) => allowedRoles.contains(role));
}
