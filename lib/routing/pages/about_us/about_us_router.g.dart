// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$aboutUsRoute];

RouteBase get $aboutUsRoute =>
    GoRouteData.$route(path: '/about-us', factory: $AboutUsRoute._fromState);

mixin $AboutUsRoute on GoRouteData {
  static AboutUsRoute _fromState(GoRouterState state) => const AboutUsRoute();

  @override
  String get location => GoRouteData.$location('/about-us');

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
