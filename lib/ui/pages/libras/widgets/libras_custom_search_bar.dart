import 'package:flutter/material.dart';

import '../../../core/widgets/search_bar.dart';


class LibrasCustomSearchBar extends CustomSearchBar {

  const LibrasCustomSearchBar({
    super.key,
    required super.onSubmitted,
    required super.controller,
    super.trailing,

    super.backgroundColor = const WidgetStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
    super.hintText = 'Buscar',
    super.leading = const Icon(Icons.search, color: textInputColor),
    super.shape = const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
          right: Radius.circular(50),
        ),
      ),
    ),
    super.side = const WidgetStatePropertyAll(
      BorderSide(color: Colors.blue, width: 1),
    ),
    super.hintStyle = const WidgetStatePropertyAll(
      TextStyle(color: textInputColor),
    ),
    super.textStyle = const WidgetStatePropertyAll(
      TextStyle(
        color: textInputColor,
        fontSize: 14,
        fontFamily: 'Poppins',
      ),
    ),
  });

  static const Color textInputColor = Color.fromRGBO(64, 29, 78, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
      child: super.build(context),
    );
  }
}

