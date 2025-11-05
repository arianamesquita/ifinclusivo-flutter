import 'package:flutter/material.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/search_not_found.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/widgets/search_result_block.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});
  final items = [
    SearchResultBlock(
      topicName: 'Html',
      description:
          'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...',
    ),
    SearchResultBlock(
      topicName: 'Html',
      description:
          'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...',
    ),
    SearchResultBlock(
      topicName: 'Html',
      description:
          'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...',
    ),
    SearchResultBlock(
      topicName: 'Html',
      description:
          'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...',
    ),
    SearchResultBlock(
      topicName: 'Html',
      description:
          'HTML é uma linguagem de marcação ustilizada na construção de páginas na Web...',
    ),
    SearchResultBlock(
      topicName: 'Html',
      description:
          'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...',
    ),
  ];

  final items2 = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Text(
                'Resultados Encontrados para o Tópico Buscado:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color.fromRGBO(28, 122, 229, 1),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Material(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child:
                  items2.isNotEmpty
                      ? CustomContainerShell(
                        child: SafeArea(
                          child: ListView.builder(
                            itemCount: items2.length,
                            itemBuilder: (context, index) {
                              final item = items2[index];
                              return SearchResultBlock(
                                topicName: item.topicName,
                                description: item.description,
                              );
                            },
                          ),
                        ),
                      )
                      : Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SearchNotFound(
                          errorIcon: Icons.error,
                          onPressed: () {
                            WordSuggestionRouter().push(context);
                          },
                        ),
                      ),
            ),
          ),
        ),
      ],
    );
  }
}
