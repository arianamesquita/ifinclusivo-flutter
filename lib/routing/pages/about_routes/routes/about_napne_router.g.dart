// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_napne_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$aboutNapneRoute];

RouteBase get $aboutNapneRoute => GoRouteData.$route(
  path: '/presentation/about-napne',
  factory: $AboutNapneRoute._fromState,
);

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
