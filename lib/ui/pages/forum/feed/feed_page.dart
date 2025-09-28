import 'package:flutter/material.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/widgets/filter_chips_bar.dart';

import '../../../../domain/models/api/response/gen_responses.dart';
import '../../../../domain/models/enums/categorias.dart';
import '../publicacao/widget/cards/publicacao_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final mockPublicacoes = [];
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
                          NewPublicacaoRouter().push(context);
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
