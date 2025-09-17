part of '../../../app_router.dart';


class ForumRouter extends GoRouteData with _$ForumRouter{
  const ForumRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomContainerShell(child:Column(
      children: [
        const Placeholder(color: Colors.green,),  const Placeholder(color: Colors.green,),
      ],
    ));
  }
}