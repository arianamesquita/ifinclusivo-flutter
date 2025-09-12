import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app_router.dart';
import '../../../app_routes.dart';

class MorePageRouter extends GoRouteData with $MorePageRouter{
  const MorePageRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(color: Colors.yellow,);
  }
}