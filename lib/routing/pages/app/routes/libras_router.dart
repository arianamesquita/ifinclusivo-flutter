part of '../../../app_router.dart';

class LibrasRouter extends GoRouteData with _$LibrasRouter{
  const LibrasRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomContainerShell(child:LibrasPage());
  }
}