import 'package:flutter/material.dart';

import '../../../utils/responsive_utils.dart';

class CustomSearchBar extends StatefulWidget {
  final Future<void> Function(String query) onSubmit;
  final Future<void> Function(String query) onQueryChanged;
  final List<String> suggestions;
  final bool loadingSuggestions;

  const CustomSearchBar({
    super.key,
    required this.onSubmit,
    required this.onQueryChanged,
    required this.suggestions,
    required this.loadingSuggestions,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final SearchController controller = SearchController();
  FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen:
          ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile,
      viewConstraints:
          (ResponsiveUtils.getDeviceType(context) != DeviceScreenType.mobile)
              ? const BoxConstraints(maxHeight: 300)
              : null,

      searchController: controller,

      viewOnChanged: (s) async => await widget.onQueryChanged(s),

      viewOnSubmitted: (value) async {
        controller.closeView(value);
        searchFocus.unfocus();
        await widget.onSubmit(value);
      },

      builder: (BuildContext context, SearchController searchController) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: searchController,
          builder: (context, value, _) {
            return TextField(
              onSubmitted: (value) async {
                controller.closeView(value);
                await widget.onSubmit(value);
              },
              focusNode: searchFocus,
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar palavras...',
                prefixIcon: Icon(Icons.search),
                suffixIcon:
                    (value.text.isNotEmpty)
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () async {
                            searchController.clear();
                            await widget.onSubmit('');
                          },
                        )
                        : null,
                filled: true,
                fillColor:
                Theme.of(
                  context,
                ).colorScheme.surfaceContainerLowest,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Color(0xFF1C7AE5)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Color(0xFF1C7AE5)),
                ),
              ),
              onTap: (){
                searchFocus.unfocus();
                searchController.openView();},
              onChanged: (query) async {
                await widget.onQueryChanged(query);
                await widget.onQueryChanged("$query ");
              },
            );
          },
        );
      },

      suggestionsBuilder: (
        BuildContext context,
        SearchController searchController,
      ) {
        final List<Widget> widgets = [];

        if (widget.loadingSuggestions) {
          widgets.add(const LinearProgressIndicator());
        }

        if (widget.suggestions.isEmpty && !widget.loadingSuggestions) {
          widgets.add(
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Nenhuma sugestão encontrada"),
            ),
          );
        } else {
          widgets.addAll(
            widget.suggestions.map((sugestao) {
              return ListTile(
                title: Text(sugestao),
                onTap: () async {
                  searchController.text = sugestao;
                  searchController.closeView(sugestao);
                  await widget.onSubmit(sugestao);
                },
              );
            }),
          );
        }

        return widgets;
      },
    );
  }
}
