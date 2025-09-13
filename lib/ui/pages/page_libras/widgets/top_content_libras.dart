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
    final titleStyleText = theme.textTheme.titleLarge!.copyWith(color: Color.fromRGBO(43, 50, 48, 1),);
    final subtitleStyleText = theme.textTheme.labelMedium!.copyWith(color: Color.fromRGBO(118, 80, 132, 1));

    return Column(
      children: [
        Text(title, style: titleStyleText,),
        SizedBox(height: 17,),
        Text(subtitle ?? "Sem título de seção.", style: subtitleStyleText,),
        SizedBox(height: 46,),
        searchBar ?? const SizedBox.shrink(),
      ],
    );
  }
}