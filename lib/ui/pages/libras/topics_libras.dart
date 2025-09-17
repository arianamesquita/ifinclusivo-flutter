import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_search_bar.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import '../../core/layout/custom_container_shell.dart';
import 'filter_block/filter_block_grid.dart';

class TopicLibras extends StatefulWidget {
  const TopicLibras({super.key});

  @override
  State<TopicLibras> createState() => _TopicLibrasState();
}

class _TopicLibrasState extends State<TopicLibras> {
  @override
  Widget build(BuildContext context) {
    var items = [
      FilterBlockGridParams(
        label: 'Redes',
        imageAsset: "assets/card_libras_icons/redes.png",
        onTap: () {
          context.push(MidiaRouter().location);
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

    String word = '';

    return device == DeviceScreenType.mobile
        ? Scaffold(
          appBar: AppBar(title: Text('Converte libras')),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LibrasCustomSearchBar(
                    onChanged: (findString) {
                      setState(() {
                        word = findString.toString();
                        print(word);
                      });
                    },
                  ),
                  Text("Um dicionário de sinais criado para a comunidade"),
                  SizedBox(height: 90),
                  FilterBlockGrid(filterBlockList: items),
                ],
              ),
            ),
          ),
        )
        : CustomContainerShell(
          child: Column(
            children: [
              SizedBox(height: 100),
              TopContentLibras(
                title: "CONVERTE LIBRAS",
                searchBar: LibrasCustomSearchBar(
                  onChanged: (findString) {
                    setState(() {
                      word = findString.toString();
                      print(word);
                    });
                  },
                ),
                subtitle: "Um dicionário de sinais criado para a comunidade",
              ),
              SizedBox(height: 15),
              FilterBlockGrid(filterBlockList: items),
              SizedBox(height: 100),
            ],
          ),
        );
  }
}
