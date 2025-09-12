// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$rootRouter];

RouteBase get $rootRouter => GoRouteData.$route(
  path: '/',
  factory: $RootRouter._fromState,
  routes: [
    StatefulShellRouteData.$route(
      factory: $ShellAboutRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/presentation',
              factory: $AboutUsRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/presentation/about-napne',
              factory: $AboutNapneRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellRouteData.$route(
      factory: $ShellAuthRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/register',
              factory: $RegisterRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellRouteData.$route(
      factory: $ShellAppRouterExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/app/forum',
              factory: $ForumRouter._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/app/libras',
              factory: $LibrasRouter._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/app/topicos',
              factory: $TopicoRouter._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/app/chat',
              factory: $ChatRouter._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/app/more',
              factory: $MorePageRouter._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/app/profile',
              factory: $ProfileRouter._fromState,
            ),
          ],
        ),
      ],
    ),
    GoRouteData.$route(
      path: 'notification',
      factory: $NotificationRouter._fromState,
    ),
  ],
);

mixin $RootRouter on GoRouteData {
  static RootRouter _fromState(GoRouterState state) => const RootRouter();

  @override
  String get location => GoRouteData.$location('/');

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

extension $ShellAboutRouteExtension on ShellAboutRoute {
  static ShellAboutRoute _fromState(GoRouterState state) =>
      const ShellAboutRoute();
}

mixin $AboutUsRoute on GoRouteData {
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

mixin $AboutNapneRoute on GoRouteData {
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

extension $ShellAuthRouteExtension on ShellAuthRoute {
  static ShellAuthRoute _fromState(GoRouterState state) =>
      const ShellAuthRoute();
}

mixin $LoginRoute on GoRouteData {
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

mixin $RegisterRoute on GoRouteData {
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

extension $ShellAppRouterExtension on ShellAppRouter {
  static ShellAppRouter _fromState(GoRouterState state) =>
      const ShellAppRouter();
}

mixin $ForumRouter on GoRouteData {
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

mixin $LibrasRouter on GoRouteData {
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

mixin $TopicoRouter on GoRouteData {
  static TopicoRouter _fromState(GoRouterState state) => const TopicoRouter();

  @override
  String get location => GoRouteData.$location('/app/topicos');

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

mixin $ChatRouter on GoRouteData {
  static ChatRouter _fromState(GoRouterState state) => const ChatRouter();

  @override
  String get location => GoRouteData.$location('/app/chat');

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

mixin $MorePageRouter on GoRouteData {
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

mixin $ProfileRouter on GoRouteData {
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

mixin $NotificationRouter on GoRouteData {
  static NotificationRouter _fromState(GoRouterState state) =>
      const NotificationRouter();

  @override
  String get location => GoRouteData.$location('/notification');

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
