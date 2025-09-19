import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/widgets/search_bar.dart';

class TopContentLibras extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final CustomSearchBar? searchBar;

  const TopContentLibras({
    super.key,
    this.title,
    this.subtitle,
    this.searchBar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyleText = theme.textTheme.titleLarge!.copyWith(
      color: Color.fromRGBO(43, 50, 48, 1),
      fontWeight: FontWeight.w600,
    );
    final subtitleStyleText = theme.textTheme.labelMedium!.copyWith(
      color: Color.fromRGBO(118, 80, 132, 1),
    );

    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 100), child: Text(title ?? "CONVERTE LIBRAS", style: titleStyleText),),
        Padding(padding: EdgeInsets.only(top: 17), child: Text(subtitle ?? "", style: subtitleStyleText),),
        Padding(padding: EdgeInsets.only(top: 41), child: searchBar ?? const SizedBox.shrink(),)
      ],
    );
  }
}
