part of '../../../app_router.dart';


class MorePageRouter extends GoRouteData with _$MorePageRouter{
  const MorePageRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomContainerShell(child:Placeholder(color: Colors.yellow,));
  }
}