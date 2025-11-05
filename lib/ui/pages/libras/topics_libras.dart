import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/search_result.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/widgets/top_content_libras.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';

import '../../core/layout/custom_container_shell.dart';
import 'filter_block/filter_block_grid.dart';

class TopicLibras extends StatefulWidget {
  const TopicLibras({super.key});

  @override
  State<TopicLibras> createState() => _TopicLibrasState();
}

class _TopicLibrasState extends State<TopicLibras> {
  String word = '';

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

    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    return device == DeviceScreenType.mobile
        ? Scaffold(
          appBar: AppBar(title: Text('Converte libras')),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Um dicionário de sinais criado para a comunidade"),
                  LibrasCustomSearchBar(
                    onTap: () => {
                      word = findString;
                    }

                  ),
                  SizedBox(height: 90),
                  word.isEmpty
                      ? FilterBlockGrid(filterBlockList: items)
                      : SearchResult(vm: context.read(),),
                ],
              ),
            ),
          ),
        )
        : CustomContainerShell(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopContentLibras(
                  title: "CONVERTE LIBRAS",
                  subtitle: "Um dicionário de sinais criado para a comunidade",
                  searchBar: LibrasCustomSearchBar(
                    onChanged: (findString) {
                      setState(() {
                        word = findString;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                word.isEmpty
                    ? FilterBlockGrid(filterBlockList: items)
                    : SearchResult(vm: context.read(),),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
  }
}
