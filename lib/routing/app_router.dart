
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_us/about_us_router.dart';


GoRouter createRouter() => GoRouter(
  initialLocation: const AboutUsRoute().location,
  routes: $appRoutes,
);