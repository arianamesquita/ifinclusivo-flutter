import 'package:if_inclusivo/guards/roles.dart';

class AppRoutes {
  // Rotas da Seção de Apresentação
  static const String aboutUs = '/presentation';
  static const String aboutNapne = '$aboutUs/about-napne';
  // Rotas de autenticação
  static const String signIn = '/login';
  static const String signUp = '/register';
  static const String unauthorized = '/unauthorized';
  static const String forbidden = '/forbidden';
  static const String serverError = '/server-error';
  static const String notFound = '/not-found';

  // Rotas da Aplicação Principal
  static const String _app = '/app';
  static const String forum = '$_app/forum';
  static const String publication = 'post/:id';
  static const String newPublication = '$_app/new-post';


  static const String libras = '$_app/libras';
  static const String midia = 'midia';
  static const String categoriaLibras = 'category/:categoria';


  static const String more = '$_app/more';
  static const String notification = '$_app/notification';
  static const String profile = '$_app/profile';
  static const String accountSecurity = 'security';

  static const String token = '/auth/verify-email';
  static const String resetPassword = '/auth/reset_password';


  // Permissões de acesso por rota
  static final Map<String, List<Roles>> permissions = {
    forum: Roles.values,
    libras: Roles.values,
    midia: Roles.values,
    categoriaLibras: Roles.values,
    notification: Roles.values,
    more: [Roles.ROLE_INTERPRETE, Roles.ROLE_TUTOR],
    profile: Roles.values,
    token: Roles.values,
    accountSecurity: Roles.values,
    resetPassword: Roles.values,
    newPublication: Roles.values
  };

  static final Set<String> publicRoutes = {
    aboutUs,
    aboutNapne,
    signIn,
    signUp,
    forum,
    libras,
    midia,
    categoriaLibras,
    token,
    resetPassword,
    unauthorized,
    forbidden,
    serverError,
    notFound
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
