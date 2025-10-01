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

  static final List<AppRoute> routes = [
    AppRoute(path: aboutUs, isPublic: true),
    AppRoute(path: aboutNapne, isPublic: true),
    AppRoute(path: signIn, isPublic: true),
    AppRoute(path: signUp, isPublic: true),

    AppRoute(path: forum, isPublic: true, allowedRoles: Roles.values),
    AppRoute(path: publication, isPublic: true, allowedRoles: Roles.values),
    AppRoute(path: newPublication, allowedRoles: Roles.values),

    AppRoute(path: libras, isPublic: true, allowedRoles: Roles.values),
    AppRoute(path: midia, isPublic: true, allowedRoles: Roles.values),
    AppRoute(path: categoriaLibras, isPublic: true, allowedRoles: Roles.values),

    AppRoute(path: more, allowedRoles: [Roles.ROLE_INTERPRETE, Roles.ROLE_TUTOR]),
    AppRoute(path: notification, allowedRoles: Roles.values),
    AppRoute(path: profile, allowedRoles: Roles.values),
    AppRoute(path: accountSecurity, allowedRoles: Roles.values),

    AppRoute(path: token, isPublic: true),
    AppRoute(path: resetPassword, isPublic: true),
    AppRoute(path: unauthorized, isPublic: true),
    AppRoute(path: forbidden, isPublic: true),
    AppRoute(path: serverError, isPublic: true),
    AppRoute(path: notFound, isPublic: true),
  ];
}

class AppRoute {
  final String path;
  final bool isPublic;
  final List<Roles> allowedRoles;

  const AppRoute({
    required this.path,
    this.isPublic = false,
    this.allowedRoles = const [],
  });

  bool matches(String candidate) {
    final patternStr = path.splitMapJoin(
      RegExp(r':\w+'),
      onMatch: (_) => r'([^/]+)',
      onNonMatch: (s) => RegExp.escape(s),
    );
    final pattern = RegExp('(^|/)' + patternStr + r'($|/)');

    return pattern.hasMatch(candidate);
  }
}
