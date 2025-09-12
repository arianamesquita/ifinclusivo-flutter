import 'package:flutter/material.dart';

class HoverableLogo extends StatefulWidget {
  final String imagePath;
  final double height;
  final VoidCallback onTap;
  final BoxFit? fit;
  const HoverableLogo({
    super.key,
    required this.imagePath,
    required this.height,
    required this.onTap, this.fit,
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
    // calcula deslocamento: sobe no hover, afunda no click
    double translateY = 0;
    if (_hovering) translateY -= 5; // sobe 5px
    if (_pressed) translateY += 3; // afunda 3px ao clicar

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
          child: Image.asset(widget.imagePath, height: widget.height,fit: widget.fit,),
        ),
      ),
    );
  }
}
