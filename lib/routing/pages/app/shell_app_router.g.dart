// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shell_app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$shellAppRouter];

RouteBase get $shellAppRouter => StatefulShellRouteData.$route(
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
        GoRouteData.$route(path: '/app/chat', factory: $ChatRouter._fromState),
      ],
    ),
  ],
);

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
