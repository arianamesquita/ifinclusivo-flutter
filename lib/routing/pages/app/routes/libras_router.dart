part of '../../../app_router.dart';

const librasBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[librasRouter],
);

const librasRouter = TypedGoRoute<LibrasRouter>(
  path: AppRoutes.libras,
  routes: [librasTopicsRoute,
    midiaRouter],
);

class LibrasRouter extends GoRouteData with _$LibrasRouter {
  const LibrasRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LibrasPage();
  }
}

const librasTopicsRoute = TypedGoRoute<LibrasTopicRouter>(
  path: AppRoutes.categoriaLibras,
);

class LibrasTopicRouter extends GoRouteData with _$LibrasTopicRouter {
  final String categoria;
  const LibrasTopicRouter(this.categoria);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SpecificTopicPage(categoria: categoria,);
  }
}

const midiaRouter = TypedGoRoute<MidiaRouter>(path: AppRoutes.midia);

class MidiaRouter extends GoRouteData with _$MidiaRouter {
  const MidiaRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MidiaPageLibras(
      titulo: 'Como Aprender Libras Sozinho do Zero',
      timestamp: 'Adicionado em sexta-feira, 22 de março de 2024',
      description:
          'Libras significa Língua Brasileira de Sinais. Através dela, é possível promover mais acessibilidade na comunicação para pessoas deficientes auditivas.',
      relacionados: ['CSS', 'SCSS', 'JavaScript', 'Angular', 'PHP'],
    );
  }
}
