
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/pages/presentation/aboult_us/about_us_page.dart';
import '../../../app_routes.dart';


part 'about_us_router.g.dart';


@TypedGoRoute<AboutUsRoute>(
  path: AppRoutes.aboutUs,
)

class AboutUsRoute extends GoRouteData with _$AboutUsRoute {
  const AboutUsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutUsPage();
  }
}