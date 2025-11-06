import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/search_result.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/widgets/top_content_libras.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../../core/layout/custom_container_shell.dart';
import '../../core/widgets/search_bar.dart';
import 'filter_block/filter_block_grid.dart';
import 'libras_search_bar/viewmodels/libras_search_bar_viewmodel.dart';

class TopicLibras extends StatefulWidget {
  const TopicLibras({super.key});

  @override
  State<TopicLibras> createState() => _TopicLibrasState();
}

class _TopicLibrasState extends State<TopicLibras> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LibrasSearchBarViewmodel>();

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

    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    final Widget content =
        vm.isSearchActive
            ? const SearchResult()
            : FilterBlockGrid(filterBlockList: items);

    const Color textInputColor = Color.fromRGBO(64, 29, 78, 1);
    var searchResult = '';

    CustomSearchBar searchBar = _buildCustomSearchBar(
      textInputColor,
      context,
      searchResult,
      vm,
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
                  searchBar,
                  SizedBox(height: 90),
                  content,
                ],
              ),
            ),
          ),
        )
        : CustomContainerShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TopContentLibras(
                title: "CONVERTE LIBRAS",
                subtitle: "Um dicionário de sinais criado para a comunidade",
                searchBar: searchBar,
              ),
              SizedBox(height: 15),
              content,
              SizedBox(height: 20),
            ],
          ),
        );
  }

  CustomSearchBar _buildCustomSearchBar(
    Color textInputColor,
    BuildContext context,
    String searchResult,
    LibrasSearchBarViewmodel vm,
  ) {
    return CustomSearchBar(
      backgroundColor: const WidgetStatePropertyAll(
        Color.fromRGBO(255, 255, 255, 1),
      ),
      hintText: 'Buscar',
      leading: Icon(Icons.search, color: textInputColor),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50),
            right: Radius.circular(50),
          ),
        ),
      ),
      side: const WidgetStatePropertyAll(
        BorderSide(color: Colors.blue, width: 1),
      ),
      hintStyle: WidgetStatePropertyAll(TextStyle(color: textInputColor)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(color: textInputColor, fontSize: 14, fontFamily: 'Poppins'),
      ),
      controller: _searchController,
      onSubmitted: (value) {
        context.read<LibrasSearchBarViewmodel>().fetchLibrasByWord(
          value.trim(),
        );
        searchResult = vm.words.toString();
      },
    );
  }
}
