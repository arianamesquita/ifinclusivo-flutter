import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/pages/presentation/about_napne/abolt_napne_page.dart';
import '../../../app_routes.dart';

part 'about_napne_router.g.dart';

@TypedGoRoute<AboutNapneRoute>(
  path: AppRoutes.aboutNapne,
)

class AboutNapneRoute extends GoRouteData with $AboutNapneRoute{
  const AboutNapneRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboltNapnePage();
  }
}