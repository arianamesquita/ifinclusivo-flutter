import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/page_libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/page_libras/widgets/top_content_libras.dart';

import 'filter_block/filter_block_grid.dart';

class LibrasPage extends StatelessWidget {
  const LibrasPage({super.key});

  @override
  Widget build(BuildContext context) {

    var items = [
      FilterBlockGridParams(
        label: 'Redes',
        imageAsset: "assets/card_libras_icons/redes.png",
        onTap: () {
          print("qualquer ");
        },
      ),
      FilterBlockGridParams(
        label: 'Banco de Dados',
        imageAsset: "assets/card_libras_icons/banco_de_dados.png",
        onTap: () {
          print("qualquer ");
        },
      ),
      FilterBlockGridParams(
        label: 'Programação',
        imageAsset: "assets/card_libras_icons/programacao.png",
        onTap: () {
          print("qualquer ");
        },
      ),
      FilterBlockGridParams(
        label: 'Web',
        imageAsset: "assets/card_libras_icons/web.png",
        onTap: () {
          print("qualquer ");
        },
      ),
      FilterBlockGridParams(
        label: 'Estrutura de Dados',
        imageAsset: "assets/card_libras_icons/estrutura_de_dados.png",
        onTap: () {
          print("qualquer ");
        },
      ),
      FilterBlockGridParams(
        label: 'Arquitetura de Computadores',
        imageAsset: "assets/card_libras_icons/arquitetura_de_comp.png",
        onTap: () {
          print("qualquer ");
        },
      ),
    ];

    return Material(
      child: Column(
        children: [
          const TopContentLibras(
            title: "CONVERTE LIBRAS",
            searchBar: LibrasCustomSearchBar(),
            subtitle: "Um dicionário de sinais criado para a comunidade",
          ),
          SizedBox(height: 90),
          FilterBlockGrid(filterBlockList: items),
        ],
      ),
    );
  }
}
