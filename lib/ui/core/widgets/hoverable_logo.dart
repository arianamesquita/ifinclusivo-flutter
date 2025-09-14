import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HoverableLogo extends StatefulWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final VoidCallback onTap;
  final BoxFit? fit;
  final bool isNetwork; // se a imagem vem da internet

  const HoverableLogo({
    super.key,
    required this.imagePath,
    this.height,
    required this.onTap,
    this.fit,
    this.isNetwork = false,
    this.width,
  });

  @override
  State<HoverableLogo> createState() => _HoverableLogoState();
}

class _HoverableLogoState extends State<HoverableLogo> {
  bool _hovering = false;
  bool _pressed = false;

  void _onTapDown(TapDownDetails details) => setState(() => _pressed = true);
  void _onTapUp(TapUpDetails details) => setState(() => _pressed = false);
  void _onTapCancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    // deslocamento: sobe no hover, afunda no click
    double translateY = 0;
    if (_hovering) translateY -= 5;
    if (_pressed) translateY += 3;

    Widget child;
    if (widget.imagePath.toLowerCase().endsWith(".svg")) {
      // --- caso SVG ---
      child =
          widget.isNetwork
              ? SvgPicture.network(
                widget.imagePath,
                height: widget.height,
                width: widget.width,
                fit: widget.fit ?? BoxFit.contain,
              )
              : SvgPicture.asset(
                widget.imagePath,
                height: widget.height,
                width: widget.width,
                fit: widget.fit ?? BoxFit.contain,
              );
    } else {
      // --- caso imagem normal ---
      child =
          widget.isNetwork
              ? Image.network(
                widget.imagePath,
                height: widget.height,
                width: widget.width,
                fit: widget.fit,
              )
              : Image.asset(
                widget.imagePath,
                height: widget.height,
                width: widget.width,

                fit: widget.fit,
              );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.identity()..translate(0, translateY, 0),
          child: child,
        ),
      ),
    );
  }
}
