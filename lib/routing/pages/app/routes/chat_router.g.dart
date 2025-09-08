// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$chatRouter];

RouteBase get $chatRouter =>
    GoRouteData.$route(path: '/app/chat', factory: $ChatRouter._fromState);

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
