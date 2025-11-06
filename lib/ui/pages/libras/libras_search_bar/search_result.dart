import 'package:flutter/material.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/search_not_found.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/viewmodels/libras_search_bar_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_search_bar/widgets/search_result_block.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<LibrasSearchBarViewmodel>();
    return ListenableBuilder(
      listenable: vm,
      builder: (context, _) {
        if (vm.state == LibrasSearchBarState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final words =
            vm.words.isEmpty
                ? []
                : vm.words.map((word) {
                  return SearchResultBlock(
                    url: word.url,
                    description: word.descricao,
                    topicName: word.palavra,
                    onTap: () => {MidiaRouter(word.id).go(context)},
                  );
                }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 90, top: 20),
              child: Text(
                'Resultados Encontrados para o Tópico Buscado:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color.fromRGBO(28, 122, 229, 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child:
                  words.isNotEmpty
                      ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...words.map(
                            (element) => SearchResultBlock(
                              topicName: element.topicName,
                              url: element.url,
                              description: element.description,
                              onTap: () {},
                            ),
                          ),
                        ],
                      )
                      : Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SearchNotFound(
                          text: 'Não encontramos esta palavra.',
                          text2: 'Nos ajude a melhorar nosso glossário!',
                          errorIcon: Icons.error,
                          onPressed: () {
                            WordSuggestionRouter().push(context);
                          },
                        ),
                      ),
            ),
          ],
        );
      },
    );
  }
}
