import 'package:flutter/material.dart';

import '../../../../core/widgets/search_bar.dart';

class ContactsCustomSearchBar extends CustomSearchBar {
  static const Color textInputColor = Color(0xFF929292);

  const ContactsCustomSearchBar({
    super.key,
    super.backgroundColor = const WidgetStatePropertyAll(Colors.transparent),
    super.overlayColor = const WidgetStatePropertyAll(Colors.transparent),
    super.shape = const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(12)))),
    super.hintText = 'Procure por um contato',
    super.leading = const Icon(Icons.search, color: textInputColor,),
    super.elevation = const WidgetStatePropertyAll(0),
    super.hintStyle = const WidgetStatePropertyAll(TextStyle(
      color: textInputColor,
      fontSize: 14,
      fontFamily: 'Poppins',
    )),
    super.textStyle = const WidgetStatePropertyAll(TextStyle(
      color: textInputColor,
      fontSize: 14,
      fontFamily: 'Poppins',
    )),
  });
}