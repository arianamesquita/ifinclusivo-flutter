import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/routing/app_router.dart';

import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../../core/layout/custom_container_shell.dart';
import '../../../core/widgets/custom_search_bar.dart';
import 'widgets/filter_block_grid.dart';
import '../libras_details/widgets/top_content_libras.dart';
import 'widgets/search_result.dart';
import 'viewmodels/libras_search_bar_viewmodel.dart';

class LibrasHomePage extends StatefulWidget {
  final LibrasHomeViewModel viewmodel;
  const LibrasHomePage({super.key, required this.viewmodel});

  @override
  State<LibrasHomePage> createState() => _LibrasHomePageState();
}

class _LibrasHomePageState extends State<LibrasHomePage> {
  final SearchController controller = SearchController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  _getItems(context) => [
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

  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(
      listenable: widget.viewmodel,
      builder: (context, _) {
        DeviceScreenType device = ResponsiveUtils.getDeviceType(context);



        return device == DeviceScreenType.mobile
            ? _buildMobile()
            : CustomContainerShell(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TopContentLibras(
                      title: "CONVERTE LIBRAS",
                      subtitle:
                          "Um dicionário de sinais criado para a comunidade",
                      searchBar: CustomSearchBar(
                        suggestions: widget.viewmodel.suggestions,
                        loadingSuggestions: widget.viewmodel.loadingSugestion,
                        onQueryChanged:
                            (q) async => await widget.viewmodel
                                .searchSuggestions(query: q),
                        onSubmit:
                            (value) async =>
                                await widget.viewmodel.fetchLibrasByWord(value),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListenableBuilder(
                        listenable: widget.viewmodel,
                        builder: (context,_){
                          final Widget content =
                          (widget.viewmodel.isSearchActive ||
                              widget.viewmodel.words.isNotEmpty)
                              ? SearchResult(viewmodel: widget.viewmodel)
                              : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 37.0),
                            child: FilterBlockGrid(filterBlockList: _getItems(context)),
                          );
                          return content;
                        }),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
      },
    );
  }

  _buildMobile() {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        SvgPicture.asset(
                          'assets/logo/logo_short_dark.svg',
                          height: 60,
                        ),
                        Text(
                          'Converte libras',
                          style: textTheme.headlineMedium,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_outlined),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 8.0,),
                child: CustomSearchBar(
                  suggestions: widget.viewmodel.suggestions,
                  loadingSuggestions: widget.viewmodel.loadingSugestion,
                  onQueryChanged:
                      (q) async =>
                  await widget.viewmodel.searchSuggestions(query: q),
                  onSubmit:
                      (value) async =>
                  await widget.viewmodel.fetchLibrasByWord(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: Theme.of(context).colorScheme.outline,
                  width: double.infinity,
                  height: 1,
                ),
              ),

              ListenableBuilder(
                  listenable: widget.viewmodel,
                  builder: (context,_){
                final Widget content =
                (widget.viewmodel.isSearchActive ||
                    widget.viewmodel.words.isNotEmpty)
                    ? SearchResult(viewmodel: widget.viewmodel)
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22.0),
                            child: Text("Um dicionário de sinais criado para a comunidade",
                              textAlign: TextAlign.center,
                              style: textTheme.titleSmall?.copyWith(
                                color: colorScheme.primary
                            ),),
                          ),
                          FilterBlockGrid(filterBlockList: _getItems(context)),
                        ],
                      ),
                    );
                return content;
              })
            ],
          ),
        ),
      ),
    );
  }
}
