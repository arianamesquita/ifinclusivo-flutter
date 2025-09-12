import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/pages/auth/sign_in/Login_dialog_content.dart';
import '../../../app_routes.dart';

part 'login_route.g.dart';
@TypedGoRoute<LoginRoute>(path: AppRoutes.signIn)
class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();


  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginDialogContent();
  }

}
