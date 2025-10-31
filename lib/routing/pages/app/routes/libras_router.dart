part of '../../../app_router.dart';

const librasBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[librasRouter],
);

const librasRouter = TypedGoRoute<LibrasRouter>(
  path: AppRoutes.libras,
  routes: [
    librasTopicsRoute,
    midiaRouter,
    wordSuggestionRouter
  ],
);

class LibrasRouter extends GoRouteData with _$LibrasRouter {
  const LibrasRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LibrasPage();
  }
}

const librasTopicsRoute = TypedGoRoute<LibrasTopicRouter>(
  path: AppRoutes.librasCategory,
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
    return Consumer<SpecificTopicViewModel>(builder: (context, viewModel, state) {
      var item = viewModel.models.isEmpty ? null : viewModel.models.firstWhere((u) => u.id == viewModel.modelId);
      var itemsRelateds = item == null ? <String>[] : viewModel.models
          .where((u) => u.categorias == item.categorias && u != item)
          .map((u) => u.palavra)
          .toList();

      return MidiaPageLibras(
          titulo: item!.palavra,
          timestamp: 'Adicionado em sexta-feira, 22 de março de 2024',
          description: item.descricao,
          relacionados: itemsRelateds,
          urlVideo: item.url!,
      );
    });
  }
}

const wordSuggestionRouter = TypedGoRoute<WordSuggestionRouter>(
  path: AppRoutes.wordSuggestion,
);

class WordSuggestionRouter extends GoRouteData with _$WordSuggestionRouter {
  const WordSuggestionRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WordSuggestionPage();
  }
}
