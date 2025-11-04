part of '../../../app_router.dart';

const librasBranch = TypedStatefulShellBranch<StatefulShellBranchData>(
  routes: <TypedRoute<RouteData>>[librasRouter],
);

const librasRouter = TypedGoRoute<LibrasRouter>(
  path: AppRoutes.libras,
  routes: [librasTopicsRoute, midiaRouter, wordSuggestionRouter],
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
    final vm = SpecificTopicViewModel(librasRepository: context.read());
    vm.fetchLibras(
      Categorias.values.firstWhere(
        (ca) => ca.name == categoria,
        orElse: () {
          NotFoundRoute().push(context);
          return Categorias.BANCO_DE_DADOS;
        },
      ),
    );
    return SpecificTopicPage(viewModel: vm);
  }
}

const midiaRouter = TypedGoRoute<MidiaRouter>(path: AppRoutes.midia);

class MidiaRouter extends GoRouteData with _$MidiaRouter {
  const MidiaRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final vm = LibrasViewModel(repository: context.read());
    vm.fetchLibrasCmd.execute(id);
    return MidiaPageLibras(viewModel: vm,);
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
