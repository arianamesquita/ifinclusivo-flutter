import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

import 'filter_block/filter_block_grid.dart';

class TopicLibras extends StatelessWidget{
  const TopicLibras({super.key});

  @override
  Widget build(BuildContext context) {
    var index = 0;

    var items = [
      FilterBlockGridParams(
        label: 'Redes',
        imageAsset: "assets/card_libras_icons/redes.png",
        onTap: () {
          index = 1;
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Banco de Dados',
        imageAsset: "assets/card_libras_icons/banco_de_dados.png",
        onTap: () {
          index = 2;
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Programação',
        imageAsset: "assets/card_libras_icons/programacao.png",
        onTap: () {
          index = 3;
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Web',
        imageAsset: "assets/card_libras_icons/web.png",
        onTap: () {
          index = 4;
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Estrutura de Dados',
        imageAsset: "assets/card_libras_icons/estrutura_de_dados.png",
        onTap: () {
          index = 5;
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Arquitetura de Computadores',
        imageAsset: "assets/card_libras_icons/arquitetura_de_comp.png",
        onTap: () {
          index = 6;
          print("tepou");
        },
      ),
    ];

    Widget page;
    switch (index) {
      case 0:
        page = const TopicLibras();
        break;
      case 1:
        page = const TopicLibras();
        break;
      case 2:
        page = const TopicLibras();
        break;
      case 3:
        page = const TopicLibras();
        break;
      case 4:
        page = const TopicLibras();
        break;
      case 5:
        page = const TopicLibras();
        break;
      case 6:
        page = const TopicLibras();
        break;
      default:
        throw UnimplementedError('no widget for $index');
    }

    return Column(
      children: [
        const TopContentLibras(
          title: "CONVERTE LIBRAS",
          searchBar: LibrasCustomSearchBar(),
          subtitle: "Um dicionário de sinais criado para a comunidade",
        ),
        SizedBox(height: 90),
        FilterBlockGrid(filterBlockList: items),
      ],
    );
  }
}