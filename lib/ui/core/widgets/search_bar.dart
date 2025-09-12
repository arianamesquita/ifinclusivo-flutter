import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final BoxConstraints? constraints;
  final WidgetStateProperty<double?>? elevation;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? shadowColor;
  final WidgetStateProperty<Color?>? surfaceTintColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final WidgetStateProperty<BorderSide?>? side;
  final WidgetStateProperty<OutlinedBorder?>? shape;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  final WidgetStateProperty<TextStyle?>? textStyle;
  final WidgetStateProperty<TextStyle?>? hintStyle;
  final TextCapitalization? textCapitalization;
  final bool enabled;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final EdgeInsets scrollPadding;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.leading,
    this.trailing,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.onSubmitted,
    this.constraints,
    this.elevation,
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.overlayColor,
    this.side,
    this.shape,
    this.padding,
    this.textStyle,
    this.hintStyle,
    this.textCapitalization,
    this.textInputAction,
    this.keyboardType,
    this.enabled = true,
    this.autoFocus = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText ?? 'Buscar',
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onTapOutside: onTapOutside,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      constraints: constraints,
      elevation: elevation,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      overlayColor: overlayColor,
      side: side,
      shape: shape,
      padding: padding,
      textStyle: textStyle,
      hintStyle: hintStyle,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      enabled: enabled,
      autoFocus: autoFocus,
      scrollPadding: scrollPadding,
    );
  }
}
