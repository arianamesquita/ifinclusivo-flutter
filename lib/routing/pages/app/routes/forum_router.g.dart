// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$forumRouter];

RouteBase get $forumRouter =>
    GoRouteData.$route(path: '/app/forum', factory: $ForumRouter._fromState);

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
