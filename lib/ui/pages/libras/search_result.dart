import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/search_not_found.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/search_result_block.dart';

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
          'HTML é uma linguagem de marcação utilizada na construção de páginas na Web...',
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
                'Resultados Encontrados para html',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color.fromRGBO(28,122,229, 1),
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        Material(
          child: items2.isNotEmpty
                  ? ListView.builder(
                    itemCount: items2.length,
                    itemBuilder: (context, index) {
                      final item = items2[index];
                      return SearchResultBlock(
                        topicName: item.topicName,
                        description: item.description,
                      );
                    },
                  )
                  : SearchNotFound(
                errorIcon: Icons.error,
                onPressed: () {  },
              ),
        ),
      ],
    );
  }
}
