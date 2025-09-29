part of '../../../app_router.dart';

const TypedStatefulShellBranch<StatefulShellBranchData> forumBranch =
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[feedRouter],
    );




const TypedGoRoute<ForumRouter> feedRouter = TypedGoRoute<ForumRouter>(
  path: AppRoutes.forum,
  routes: [publicationRouter],
);

class ForumRouter extends GoRouteData with _$ForumRouter {
  const ForumRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FeedPage();
  }
}

const TypedGoRoute<PublicacaoRouter> publicationRouter =
    TypedGoRoute<PublicacaoRouter>(path: AppRoutes.publication);

class PublicacaoRouter extends GoRouteData with _$PublicacaoRouter {
  final int id;
  const PublicacaoRouter(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PublicacaoPage(id: id);
  }
}

@TypedGoRoute<NewPublicacaoRouter>(path: AppRoutes.newPublication)
class NewPublicacaoRouter extends GoRouteData with _$NewPublicacaoRouter {
  const NewPublicacaoRouter();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final model = state.extra as PublicacaoDetalhadaModel?;

    final device = ResponsiveUtils.getDeviceType(context);
    if (device == DeviceScreenType.mobile) {
      return  MaterialPage(
        fullscreenDialog: true,
        child: NewPublicationPage(model:model ),
      );
    } else {
      return DialogPage(
        builder: (context) =>  Dialog(
          child: NewPublicationPage(model:model ,),
        ),
      );
    }
  }
}
