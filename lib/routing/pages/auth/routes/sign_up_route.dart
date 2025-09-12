import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/pages/auth/sing_up/register_dialog_content.dart';
import '../../../app_router.dart';
import '../../../app_routes.dart';

class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return  const RegisterDialogContent();//
  }
}
