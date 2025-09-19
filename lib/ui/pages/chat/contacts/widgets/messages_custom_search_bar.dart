import 'package:flutter/material.dart';

import '../../../../core/widgets/search_bar.dart';

class MessagesCustomSearchBar extends CustomSearchBar {
  static const Color textInputColor = Color(0xFF929292);

  const MessagesCustomSearchBar({
    super.key,
    super.backgroundColor = const WidgetStatePropertyAll(Color(0xFFF3F3F3)),
    super.shape = const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(12)))),
    super.padding  = const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    super.hintText = 'Pesquise mensagens',
    super.leading = const Icon(Icons.search, color: textInputColor,),
    super.elevation = const WidgetStatePropertyAll(0),
    super.hintStyle = const WidgetStatePropertyAll(TextStyle(
      color: textInputColor,
    )),
    super.textStyle = const WidgetStatePropertyAll(TextStyle(
      color: textInputColor,
      fontSize: 14,
      fontFamily: 'Poppins',
    )),
  });
}