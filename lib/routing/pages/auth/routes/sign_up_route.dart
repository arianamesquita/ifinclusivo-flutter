part of '../../../app_router.dart';

@TypedGoRoute<RegisterRoute>(path: AppRoutes.signUp)
class RegisterRoute extends GoRouteData with _$RegisterRoute {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterDialogContent();
  }

}
