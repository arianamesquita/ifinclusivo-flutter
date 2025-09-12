import 'package:flutter/material.dart';

import '../../../core/widgets/search_bar.dart';

class LibrasCustomSearchBar extends CustomSearchBar {
  static const Color textInputColor = Color.fromRGBO(255, 255, 255, 1);

  const LibrasCustomSearchBar({
    super.key,
    super.backgroundColor = const WidgetStatePropertyAll(Color.fromRGBO(196, 149, 247, 0.45)),
    super.hintText = 'Buscar',
    super.leading = const Icon(Icons.search, color: Color.fromRGBO(224, 224, 224, 1),),
    super.elevation = const WidgetStatePropertyAll(0),
    super.hintStyle = const WidgetStatePropertyAll(TextStyle(
      fontStyle: FontStyle.italic,
      color: textInputColor,
    )),
    super.textStyle = const WidgetStatePropertyAll(TextStyle(
      color: textInputColor,
      fontSize: 14,
      fontFamily: 'Poppins',
    )),
  });
}