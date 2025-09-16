import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../core/layout/custom_container_shell.dart';
import 'filter_block/filter_block_grid.dart';

class TopicLibras extends StatelessWidget{
  const TopicLibras({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      FilterBlockGridParams(
        label: 'Redes',
        imageAsset: "assets/card_libras_icons/redes.png",
        onTap: () {
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Banco de Dados',
        imageAsset: "assets/card_libras_icons/banco_de_dados.png",
        onTap: () {
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Programação',
        imageAsset: "assets/card_libras_icons/programacao.png",
        onTap: () {
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Web',
        imageAsset: "assets/card_libras_icons/web.png",
        onTap: () {
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Estrutura de Dados',
        imageAsset: "assets/card_libras_icons/estrutura_de_dados.png",
        onTap: () {
          print("tepou");
        },
      ),
      FilterBlockGridParams(
        label: 'Arquitetura de Computadores',
        imageAsset: "assets/card_libras_icons/arquitetura_de_comp.png",
        onTap: () {
          print("tepou");
        },
      ),
    ];

    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    return device == DeviceScreenType.mobile?
        Scaffold(
          appBar: AppBar(title:  Text('Converte libras'),),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LibrasCustomSearchBar(),
                  Text("Um dicionário de sinais criado para a comunidade"),
                  SizedBox(height: 90),
                  FilterBlockGrid(filterBlockList: items),
                ],
              ),
            ),
          ),
        )

        :CustomContainerShell(child: Column(
      children: [
        const TopContentLibras(
          title: "CONVERTE LIBRAS",
          searchBar: LibrasCustomSearchBar(),
          subtitle: "Um dicionário de sinais criado para a comunidade",
        ),
        SizedBox(height: 90),
        FilterBlockGrid(filterBlockList: items),
      ],
    ));
  }
}