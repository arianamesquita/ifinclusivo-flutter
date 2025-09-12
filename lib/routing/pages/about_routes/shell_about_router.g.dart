// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shell_about_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$shellAboutRoute];

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
