import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/ui/core/widgets/search_bar.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/widgets/filter_chips_bar.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/publicacao_card.dart';

import '../../../../domain/models/enums/categorias.dart';

class PublicacaoPage extends StatefulWidget {
  const PublicacaoPage({super.key});

  @override
  State<PublicacaoPage> createState() => _PublicacaoPageState();
}

class _PublicacaoPageState extends State<PublicacaoPage> {
  final List<PublicacaoCardModel> mockPublicacoes = [
    // --- Publicação 1 ---
    PublicacaoCardModel(
      id: 1,
      titulo: "O que há de novo no Flutter 5.0?",
      texto:
      "Uma análise completa das novas features, widgets e melhorias de performance na última versão do framework da Google. Prepare-se para o futuro do desenvolvimento multi-plataforma!",
      dataCriacao: DateTime.now().subtract(const Duration(hours: 2)),
      autor: const AutorCardModel(id: 101, nome: "Ana Coder"),
      categorias: const {Categorias.PROGRAMACAO, Categorias.WEB},
      likesCount: 152,
      comentariosCount: 23,
      isLiked: true, // O usuário já curtiu esta
    ),

    // --- Publicação 2 ---
    PublicacaoCardModel(
      id: 2,
      titulo: "Normalização de Banco de Dados: Um Guia Prático",
      texto:
      "Aprenda as 3 primeiras formas normais (1FN, 2FN, 3FN) com exemplos práticos para evitar redundância e garantir a integridade dos seus dados.",
      dataCriacao: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      autor: const AutorCardModel(id: 102, nome: "Carlos D. B."),
      categorias: const {Categorias.BANCO_DE_DADOS},
      likesCount: 99,
      comentariosCount: 12,
      isLiked: false, // O usuário não curtiu esta
    ),

    // --- Publicação 3 ---
    PublicacaoCardModel(
      id: 3,
      titulo: "Qual a diferença real entre um i7 e um i9 para compilar projetos?",
      texto:
      "Estou montando uma máquina nova e estou na dúvida se o investimento extra em um Core i9 vale a pena para compilação de projetos em C++ e Flutter. Alguém tem benchmarks?",
      dataCriacao: DateTime.now().subtract(const Duration(minutes: 45)),
      autor: const AutorCardModel(id: 103, nome: "Bia SysAdmin"),
      categorias: const {
        Categorias.PROGRAMACAO
      },
      likesCount: 15,
      comentariosCount: 4,
      isLiked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 738),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0,bottom: 32),
                    child: buildheader(context),
                  ),
                  SearchAnchor(
                    builder: (
                      BuildContext context,
                      SearchController controller,
                    ) {
                      return SearchBar(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Theme.of(context).colorScheme.surface,
                        ), // Fundo transparente
                        shape: WidgetStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              28.0,
                            ), // Borda arredondada
                            side: BorderSide(
                              color: Colors.blue.shade400, // Cor da borda
                              width: 1.5, // Espessura da borda
                            ),
                          ),
                        ),
                        controller: controller,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                      );
                    },
                    suggestionsBuilder: (
                      BuildContext context,
                      SearchController controller,
                    ) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: FilterChipsBar(
                      onChanged: (filters, order) {
                        debugPrint(
                          'Selecionados: $filters | Ordenar por: $order',
                        );
                      },
                    ),
                  ),
                ],
              ),
              ...mockPublicacoes.map((pubDto) {
                return PublicacaoCard(model: pubDto);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildheader(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        Text('Conecta IF', style: Theme.of(context).textTheme.headlineMedium),
        Text(
          'Compartilhe dúvidas, ideias e soluções com a comunidade',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
