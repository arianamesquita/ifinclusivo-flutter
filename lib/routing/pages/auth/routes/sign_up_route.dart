import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/pages/auth/sing_up/register_dialog_content.dart';
import '../../../app_routes.dart';


part 'sign_up_route.g.dart';

@TypedGoRoute<RegisterRoute>(path: AppRoutes.signUp)
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  const RegisterDialogContent();//
  }
}
