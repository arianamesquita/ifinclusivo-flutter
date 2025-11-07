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
    return LibrasPage(viewmodel: context.read(),);
  }
}

const librasTopicsRoute = TypedGoRoute<LibrasTopicRouter>(
  path: AppRoutes.librasCategory,
  routes: [midiaCategoriaRouter]
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
  final int id;
  final String? categoria;

  const MidiaRouter(this.id, {this.categoria});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final vm = LibrasViewModel(repository: context.read());
    vm.fetchLibrasCmd.execute(id);
    vm.fetchRelacionados(id: id);
    return MidiaPageLibras(viewModel: vm,);
  }
}
const midiaCategoriaRouter = TypedGoRoute<MidiaCategoriaRouter>(path: AppRoutes.midia);

class MidiaCategoriaRouter extends GoRouteData with _$MidiaCategoriaRouter{
// 1. Adicione o parâmetro da rota PAI
  final String categoria;

  // 2. Mantenha o parâmetro da rota FILHA
  final int id;

  const MidiaCategoriaRouter({
    required this.categoria,
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final vm = LibrasViewModel(repository: context.read());
    vm.fetchLibrasCmd.execute(id);
    vm.fetchRelacionados(id: id);
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
    return WordSuggestionPage(viewModel: WordSuggestionViewModel(librasRepository: context.read<LibrasRepository>()),);
  }
}
