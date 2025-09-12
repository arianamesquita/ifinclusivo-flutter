// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'libras_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$librasRouter];

RouteBase get $librasRouter =>
    GoRouteData.$route(path: '/app/libras', factory: _$LibrasRouter._fromState);

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
