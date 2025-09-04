import 'package:flutter/material.dart';

Color shadeColor(Color color, double strength) {
  assert(strength >= 0 && strength <= 1);
  final hsl = HSLColor.fromColor(color);
  final lightness = (1 - strength) * hsl.lightness;

  return hsl.withLightness(lightness.clamp(0.0, 1.0)).toColor();
}
