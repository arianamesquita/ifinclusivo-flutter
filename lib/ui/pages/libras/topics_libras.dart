import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/search_result.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/widgets/top_content_libras.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../../core/layout/custom_container_shell.dart';
import 'filter_block/filter_block_grid.dart';
import 'libras_search_bar/viewmodels/libras_search_bar_viewmodel.dart';

class TopicLibras extends StatefulWidget {
  final LibrasSearchBarViewmodel viewmodel;
  const TopicLibras({super.key, required this.viewmodel});

  @override
  State<TopicLibras> createState() => _TopicLibrasState();
}

class _TopicLibrasState extends State<TopicLibras> {
  final SearchController controller = SearchController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      FilterBlockGridParams(
        label: 'Redes',
        imageAsset: "assets/card_libras_icons/redes.png",
        onTap: () {
          LibrasTopicRouter(Categorias.REDES.name).go(context);
        },
      ),
      FilterBlockGridParams(
        label: 'Banco de Dados',
        imageAsset: "assets/card_libras_icons/banco_de_dados.png",
        onTap: () {
          LibrasTopicRouter(Categorias.BANCO_DE_DADOS.name).go(context);
        },
      ),
      FilterBlockGridParams(
        label: 'Programação',
        imageAsset: "assets/card_libras_icons/programacao.png",
        onTap: () {
          LibrasTopicRouter(Categorias.PROGRAMACAO.name).go(context);
        },
      ),
      FilterBlockGridParams(
        label: 'Web',
        imageAsset: "assets/card_libras_icons/web.png",
        onTap: () {
          LibrasTopicRouter(Categorias.WEB.name).go(context);
        },
      ),
      FilterBlockGridParams(
        label: 'Estrutura de Dados',
        imageAsset: "assets/card_libras_icons/estrutura_de_dados.png",
        onTap: () {
          LibrasTopicRouter(Categorias.ESTRUTURA_DE_DADOS.name).go(context);
        },
      ),
      FilterBlockGridParams(
        label: 'Arquitetura de Computadores',
        imageAsset: "assets/card_libras_icons/arquitetura_de_comp.png",
        onTap: () {
          LibrasTopicRouter(
            Categorias.ARQUITETURA_DE_COMPUTADORES.name,
          ).go(context);
        },
      ),
    ];
    return ListenableBuilder(
      listenable: widget.viewmodel,
      builder: (context, _) {
        DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

        final Widget content =
            (widget.viewmodel.isSearchActive ||
                    widget.viewmodel.words.isNotEmpty)
                ? SearchResult(viewmodel: widget.viewmodel)
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 37.0),
                  child: FilterBlockGrid(filterBlockList: items),
                );

        return device == DeviceScreenType.mobile
            ? Scaffold(
              appBar: AppBar(title: Text('Converte libras')),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Um dicionário de sinais criado para a comunidade"),
                      LibrasCustomSearchBar(
                        controller: controller,
                        onSubmitted: (value) {
                          context
                              .read<LibrasSearchBarViewmodel>()
                              .fetchLibrasByWord(value.trim());
                        },
                      ),
                      SizedBox(height: 90),
                      content,
                    ],
                  ),
                ),
              ),
            )
            : CustomContainerShell(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TopContentLibras(
                      title: "CONVERTE LIBRAS",
                      subtitle:
                          "Um dicionário de sinais criado para a comunidade",
                      searchBar: buildValueListenableBuilder(),
                    ),
                    SizedBox(height: 15),
                    content,
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
      },
    );
  }

  Widget buildValueListenableBuilder() {
    return SearchAnchor(
      isFullScreen:
          ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile,
      viewConstraints:
          (ResponsiveUtils.getDeviceType(context) != DeviceScreenType.mobile)
              ? BoxConstraints(maxHeight: 300)
              : null,
      searchController: controller,
      viewOnChanged: (s) async => await widget.viewmodel.searchSuggestions(query: s),
      viewOnSubmitted: (value) async {
        controller.closeView(value);
        await widget.viewmodel.fetchLibrasByWord(value);
      },
      builder: (BuildContext context, SearchController searchController) {
        return  ValueListenableBuilder<TextEditingValue>(
          valueListenable: searchController,
          builder: (context, value, _) {
            return SearchBar(
              onSubmitted: (value) async {
                controller.closeView(value);
                await widget.viewmodel.fetchLibrasByWord(value);
              },
              controller: searchController,
              hintText: 'Buscar palavras...',
              onTap: () {
                searchController.openView();
              },
              onChanged: (query) async {
                widget.viewmodel.searchSuggestions(query: query);
                await widget.viewmodel.searchSuggestions(query: '$query ');
              },
              trailing: [
                if (value.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () async {
                      searchController.clear();
                      await widget.viewmodel.fetchLibrasByWord('');
                    },
                  ),
              ],
            );
          },
        );
      },
      suggestionsBuilder: (
        BuildContext context,
        SearchController searchController,
      ) {
        final suggestions = widget.viewmodel.suggestions;

        final List<Widget> widgets = [];

        if (widget.viewmodel.loadingSugestion) {
          widgets.add(const LinearProgressIndicator());
        }

        if (suggestions.isEmpty && !widget.viewmodel.loadingSugestion) {
          widgets.add(
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Nenhuma sugestão encontrada'),
            ),
          );
        } else {
          widgets.addAll(
            suggestions.map((sugestao) {
              return ListTile(
                title: Text(sugestao),
                onTap: () async {
                  searchController.text = sugestao;
                  searchController.closeView(sugestao);
                  await widget.viewmodel.fetchLibrasByWord(sugestao);
                },
              );
            }),
          );
        }
        return widgets;
      },
    );
  }
}
