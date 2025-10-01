part of '../../../app_router.dart';
@TypedGoRoute<LoginRoute>(path: AppRoutes.signIn)
class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginDialogContent();
  }
}
