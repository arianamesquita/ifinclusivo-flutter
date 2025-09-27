import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/publication_tile.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/publication.dart';

import '../../../../domain/models/enums/categorias.dart';
import '../feed/widgets/sort_dropdown_button.dart';

class PublicacaoPage extends StatefulWidget {
  const PublicacaoPage({super.key});

  @override
  State<PublicacaoPage> createState() => _PublicacaoPageState();
}

class _PublicacaoPageState extends State<PublicacaoPage> {
  String _selectedOrder = 'Relevância';

  final mock = PublicacaoDetalhadaModel(
    id: 1,
    titulo: "O que há de novo no Flutter 5.0?",
    texto:
        "Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma! Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma!",
    dataCriacao: DateTime.now().subtract(const Duration(hours: 2)),
    usuario: const AutorCardModel(id: 101, nome: "Ana Coder"),
    categorias: const {Categorias.PROGRAMACAO, Categorias.WEB},
    totalLikes: 152,
    totalRespostas: 23,
    curtidoPeloUsuario: true, // O usuário já curtiu esta
  );
  
  final subPublis = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post'), centerTitle: true),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Publication(model: mock),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Soluções da comunidade:',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                  SortDropdownButton(
                                    menuItems: ['Relevância', 'Mais recente'],
                                    selectedItem: _selectedOrder,
                                    onSelected: (String value) {
                                      setState(() {
                                        _selectedOrder=value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(),
                            ),
                          ],
                        ),
                        ...subPublis.map((model) {
                          return PublicacaoTile(model: model);
                        })
                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                      child: SearchBar(hintText: 'Responder ${mock.usuario.nome}',elevation:WidgetStatePropertyAll(0) , onTap: ()=>context.push(NewPublicacaoRouter().location, extra: mock),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
