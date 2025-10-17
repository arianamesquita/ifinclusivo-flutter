part of '../../../app_router.dart';

const TypedStatefulShellBranch<StatefulShellBranchData> forumBranch =
    TypedStatefulShellBranch<StatefulShellBranchData>(
      routes: <TypedRoute<RouteData>>[feedRouter,],
    );



const feedRouter = TypedGoRoute<ForumRouter>(
  path: AppRoutes.forum,
  routes: [
    publicacaoRoute
  ]
);
class ForumRouter extends GoRouteData with _$ForumRouter {
  const ForumRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FeedPage();
  }
}

const publicacaoRoute = TypedGoRoute<PublicacaoRouter>(
  path: AppRoutes.publication,
);

class PublicacaoRouter extends GoRouteData with _$PublicacaoRouter {
  final int id;
  const PublicacaoRouter(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = PublicacaoViewModel(forumRepository: context.read(), authRepository: context.read());
        vm.fetchPublicationCommand.execute(id);
        vm.fetchRespostasCommand.execute(id, Ordenacao.RELEVANCIA);
        return vm;
      },
      child: PublicacaoPage(id: id),
    );
  }
}

@TypedGoRoute<NewPublicacaoRouter>(path: AppRoutes.newPublication)
class NewPublicacaoRouter extends GoRouteData with _$NewPublicacaoRouter {
  const NewPublicacaoRouter();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final publicacao = state.extra is PublicacaoDetalhadaModel
        ? state.extra as PublicacaoDetalhadaModel
        : null;

    final device = ResponsiveUtils.getDeviceType(context);
    if (device == DeviceScreenType.mobile) {
      return  MaterialPage(
        fullscreenDialog: true,
        child: PublicationEditorPage(publicacaoDetalhadaModel: publicacao,),
      );
    } else {
      return DialogPage(
        builder: (context) =>  Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: PublicationEditorPage(publicacaoDetalhadaModel: publicacao,),
        ),
      );
    }
  }
}
