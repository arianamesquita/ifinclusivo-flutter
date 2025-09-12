part of '../../../app_router.dart';


class RegisterRoute extends GoRouteData with _$RegisterRoute {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterDialogContent();
  }

}
