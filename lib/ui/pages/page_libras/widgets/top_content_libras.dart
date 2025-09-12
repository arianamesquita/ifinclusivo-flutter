import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/widgets/search_bar.dart';

class TopContentLibras extends StatelessWidget{
  final String title;
  final String? subtitle;
  final CustomSearchBar? searchBar;

  const TopContentLibras({
    super.key,
    required this.title,
    this.subtitle,
    this.searchBar,
});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleText = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.primary);

    return Column(
      children: [
        Text(title, style: styleText,),
        Text(subtitle ?? "Sem título de seção."),
        searchBar ?? const SizedBox.shrink(),
      ],
    );
  }
}