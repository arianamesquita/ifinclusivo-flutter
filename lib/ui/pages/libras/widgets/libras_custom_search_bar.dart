import 'package:flutter/material.dart';

import '../../../core/widgets/search_bar.dart';

class LibrasCustomSearchBar extends CustomSearchBar {
  static const Color textInputColor = Color.fromRGBO(64, 29, 78, 1);

  const LibrasCustomSearchBar({
    super.key,
    super.backgroundColor = const WidgetStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
    super.hintText = 'Buscar',
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