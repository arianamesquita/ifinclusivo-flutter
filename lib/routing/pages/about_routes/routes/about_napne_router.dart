import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../ui/pages/presentation/about_napne/about_napne_page.dart';
import '../../../app_routes.dart';
import '../../../app_router.dart';


class AboutNapneRoute extends GoRouteData with $AboutNapneRoute{
  const AboutNapneRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboltNapnePage();
  }
}