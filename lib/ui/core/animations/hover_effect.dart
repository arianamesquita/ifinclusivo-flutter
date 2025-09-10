import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scale;
  final double elevation;
  final Color? hoverColor;
  final bool enableHover;

  const HoverEffect({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 180),
    this.scale = 1.03,
    this.elevation = 12,
    this.hoverColor,
    this.enableHover = true,
  });

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enableHover) return widget.child;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..scale(_hovering ? widget.scale : 1.0),

        child: widget.child,
      ),
    );
  }
}
