import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_routes.dart';

part 'forum_router.g.dart';

@TypedGoRoute<ForumRouter>(
  path: AppRoutes.forum,
)
class ForumRouter extends GoRouteData with $ForumRouter{
  const ForumRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.green,);
  }
}