
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/pages/about_us/about_us_page.dart';


part 'about_us_router.g.dart';

@TypedGoRoute<AboutUsRoute>(
  path: '/about-us',
)
class AboutUsRoute extends GoRouteData with $AboutUsRoute{
  const AboutUsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutUsPage();
  }
}