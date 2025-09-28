// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $notificationRouter,
  $tokenValidateRouter,
  $resetPasswordRoute,
  $shellAppRouter,
  $shellAboutRoute,
  $shellAuthRoute,
  $unauthorizedRoute,
  $forbiddenRoute,
  $serverErrorRoute,
  $notFoundRoute,
];

RouteBase get $notificationRouter => GoRouteData.$route(
  path: '/app/notification',

  factory: _$NotificationRouter._fromState,
);

mixin _$NotificationRouter on GoRouteData {
  static NotificationRouter _fromState(GoRouterState state) =>
      const NotificationRouter();

  @override
  String get location => GoRouteData.$location('/app/notification');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tokenValidateRouter => GoRouteData.$route(
  path: '/auth/verify-email',

  factory: _$TokenValidateRouter._fromState,
);

mixin _$TokenValidateRouter on GoRouteData {
  static TokenValidateRouter _fromState(GoRouterState state) =>
      TokenValidateRouter(token: state.uri.queryParameters['token']);

  TokenValidateRouter get _self => this as TokenValidateRouter;

  @override
  String get location => GoRouteData.$location(
    '/auth/verify-email',
    queryParams: {if (_self.token != null) 'token': _self.token},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resetPasswordRoute => GoRouteData.$route(
  path: '/auth/reset_password',

  factory: _$ResetPasswordRoute._fromState,
);

mixin _$ResetPasswordRoute on GoRouteData {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      ResetPasswordRoute(token: state.uri.queryParameters['token']);

  ResetPasswordRoute get _self => this as ResetPasswordRoute;

  @override
  String get location => GoRouteData.$location(
    '/auth/reset_password',
    queryParams: {if (_self.token != null) 'token': _self.token},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellAppRouter => StatefulShellRouteData.$route(
  factory: $ShellAppRouterExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/forum',

          factory: _$ForumRouter._fromState,
          routes: [
            GoRouteData.$route(
              path: 'post/:id',

              factory: _$PublicacaoRouter._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/libras',

          factory: _$LibrasRouter._fromState,
          routes: [
            GoRouteData.$route(
              path: 'category/:categoria',

              factory: _$LibrasTopicRouter._fromState,
            ),
            GoRouteData.$route(
              path: 'midia',

              factory: _$MidiaRouter._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/more',

          factory: _$MorePageRouter._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/profile',

          factory: _$ProfileRouter._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/app/new-post',

          factory: _$NewPublicacaoRouter._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellAppRouterExtension on ShellAppRouter {
  static ShellAppRouter _fromState(GoRouterState state) =>
      const ShellAppRouter();
}

mixin _$ForumRouter on GoRouteData {
  static ForumRouter _fromState(GoRouterState state) => const ForumRouter();

  @override
  String get location => GoRouteData.$location('/app/forum');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$PublicacaoRouter on GoRouteData {
  static PublicacaoRouter _fromState(GoRouterState state) =>
      PublicacaoRouter(state.pathParameters['id']!);

  PublicacaoRouter get _self => this as PublicacaoRouter;

  @override
  String get location =>
      GoRouteData.$location('/app/forum/post/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LibrasRouter on GoRouteData {
  static LibrasRouter _fromState(GoRouterState state) => const LibrasRouter();

  @override
  String get location => GoRouteData.$location('/app/libras');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$LibrasTopicRouter on GoRouteData {
  static LibrasTopicRouter _fromState(GoRouterState state) =>
      LibrasTopicRouter(state.pathParameters['categoria']!);

  LibrasTopicRouter get _self => this as LibrasTopicRouter;

  @override
  String get location => GoRouteData.$location(
    '/app/libras/category/${Uri.encodeComponent(_self.categoria)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MidiaRouter on GoRouteData {
  static MidiaRouter _fromState(GoRouterState state) => const MidiaRouter();

  @override
  String get location => GoRouteData.$location('/app/libras/midia');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MorePageRouter on GoRouteData {
  static MorePageRouter _fromState(GoRouterState state) =>
      const MorePageRouter();

  @override
  String get location => GoRouteData.$location('/app/more');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ProfileRouter on GoRouteData {
  static ProfileRouter _fromState(GoRouterState state) => const ProfileRouter();

  @override
  String get location => GoRouteData.$location('/app/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$NewPublicacaoRouter on GoRouteData {
  static NewPublicacaoRouter _fromState(GoRouterState state) =>
      const NewPublicacaoRouter();

  @override
  String get location => GoRouteData.$location('/app/new-post');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellAboutRoute => StatefulShellRouteData.$route(
  factory: $ShellAboutRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/presentation',

          factory: _$AboutUsRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/presentation/about-napne',

          factory: _$AboutNapneRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellAboutRouteExtension on ShellAboutRoute {
  static ShellAboutRoute _fromState(GoRouterState state) =>
      const ShellAboutRoute();
}

mixin _$AboutUsRoute on GoRouteData {
  static AboutUsRoute _fromState(GoRouterState state) => const AboutUsRoute();

  @override
  String get location => GoRouteData.$location('/presentation');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AboutNapneRoute on GoRouteData {
  static AboutNapneRoute _fromState(GoRouterState state) =>
      const AboutNapneRoute();

  @override
  String get location => GoRouteData.$location('/presentation/about-napne');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellAuthRoute => StatefulShellRouteData.$route(
  factory: $ShellAuthRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/login', factory: _$LoginRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/register',

          factory: _$RegisterRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellAuthRouteExtension on ShellAuthRoute {
  static ShellAuthRoute _fromState(GoRouterState state) =>
      const ShellAuthRoute();
}

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $unauthorizedRoute => GoRouteData.$route(
  path: '/unauthorized',

  factory: _$UnauthorizedRoute._fromState,
);

mixin _$UnauthorizedRoute on GoRouteData {
  static UnauthorizedRoute _fromState(GoRouterState state) =>
      const UnauthorizedRoute();

  @override
  String get location => GoRouteData.$location('/unauthorized');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forbiddenRoute => GoRouteData.$route(
  path: '/forbidden',

  factory: _$ForbiddenRoute._fromState,
);

mixin _$ForbiddenRoute on GoRouteData {
  static ForbiddenRoute _fromState(GoRouterState state) =>
      const ForbiddenRoute();

  @override
  String get location => GoRouteData.$location('/forbidden');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $serverErrorRoute => GoRouteData.$route(
  path: '/server-error',

  factory: _$ServerErrorRoute._fromState,
);

mixin _$ServerErrorRoute on GoRouteData {
  static ServerErrorRoute _fromState(GoRouterState state) =>
      const ServerErrorRoute();

  @override
  String get location => GoRouteData.$location('/server-error');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notFoundRoute =>
    GoRouteData.$route(path: '/not-found', factory: _$NotFoundRoute._fromState);

mixin _$NotFoundRoute on GoRouteData {
  static NotFoundRoute _fromState(GoRouterState state) => NotFoundRoute();

  @override
  String get location => GoRouteData.$location('/not-found');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
