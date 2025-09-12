// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topico_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$topicoRouter];

RouteBase get $topicoRouter => GoRouteData.$route(
  path: '/app/topicos',

  factory: _$TopicoRouter._fromState,
);

mixin _$TopicoRouter on GoRouteData {
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
