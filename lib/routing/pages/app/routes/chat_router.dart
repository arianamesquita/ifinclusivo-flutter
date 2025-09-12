import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_routes.dart';

part 'chat_router.g.dart';

@TypedGoRoute<ChatRouter>(
  path: AppRoutes.chat,
)
class ChatRouter extends GoRouteData with _$ChatRouter{
  const ChatRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.red,);
  }
}