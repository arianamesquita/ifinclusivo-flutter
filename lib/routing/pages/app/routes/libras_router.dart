import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/pages/page_libras/page_libras.dart';

import '../../../app_routes.dart';

part 'libras_router.g.dart';

@TypedGoRoute<LibrasRouter>(
  path: AppRoutes.libras,
)
class LibrasRouter extends GoRouteData with _$LibrasRouter{
  const LibrasRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LibrasPage();
  }
}