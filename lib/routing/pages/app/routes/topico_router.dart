import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_routes.dart';

part 'topico_router.g.dart';

@TypedGoRoute<TopicoRouter>(
  path: AppRoutes.topico,
)
class TopicoRouter extends GoRouteData with _$TopicoRouter{
  const TopicoRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.blue,);
  }
}