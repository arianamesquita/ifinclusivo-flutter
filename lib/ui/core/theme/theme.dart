import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff765084),
      surfaceTint: Color(0xff765084),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff8d8ff),
      onPrimaryContainer: Color(0xff5d386b),
      secondary: Color(0xff3b6939),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffbcf0b4),
      onSecondaryContainer: Color(0xff235024),
      tertiary: Color(0xff166b54),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa4f2d5),
      onTertiaryContainer: Color(0xff00513e),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff73332d),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff161d1b),
      onSurfaceVariant: Color(0xff48454e),
      outline: Color(0xff79757f),
      outlineVariant: Color(0xffc9c4d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xffe4b7f3),
      primaryFixed: Color(0xfff8d8ff),
      onPrimaryFixed: Color(0xff2d0a3c),
      primaryFixedDim: Color(0xffe4b7f3),
      onPrimaryFixedVariant: Color(0xff5d386b),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff002204),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff235024),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xff89d6b9),
      onTertiaryFixedVariant: Color(0xff00513e),
      surfaceDim: Color(0xffd5dbd9),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe9efed),
      surfaceContainerHigh: Color(0xffe3eae7),
      surfaceContainerHighest: Color(0xffdde4e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe4b7f3),
      surfaceTint: Color(0xffe4b7f3),
      onPrimary: Color(0xff442253),
      primaryContainer: Color(0xff5d386b),
      onPrimaryContainer: Color(0xfff8d8ff),
      secondary: Color(0xffa1d39a),
      onSecondary: Color(0xff0a390f),
      secondaryContainer: Color(0xff235024),
      onSecondaryContainer: Color(0xffbcf0b4),
      tertiary: Color(0xff89d6b9),
      onTertiary: Color(0xff00382a),
      tertiaryContainer: Color(0xff00513e),
      onTertiaryContainer: Color(0xffa4f2d5),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73332d),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffdde4e1),
      onSurfaceVariant: Color(0xffc9c4d0),
      outline: Color(0xff938f99),
      outlineVariant: Color(0xff48454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff765084),
      primaryFixed: Color(0xfff8d8ff),
      onPrimaryFixed: Color(0xff2d0a3c),
      primaryFixedDim: Color(0xffe4b7f3),
      onPrimaryFixedVariant: Color(0xff5d386b),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff002204),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff235024),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xff89d6b9),
      onTertiaryFixedVariant: Color(0xff00513e),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff343b39),
      surfaceContainerLowest: Color(0xff090f0e),
      surfaceContainerLow: Color(0xff161d1b),
      surfaceContainer: Color(0xff1a211f),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303634),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [
    buildExtendedColor(const Color.fromRGBO(98, 191, 98, 1)),
    buildExtendedColor(const Color.fromRGBO(28, 122, 229, 1.0)),
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily dark;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.dark,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

ExtendedColor buildExtendedColor(Color seed) {
  final light = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    primary: seed
  );
  final dark = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  );

  return ExtendedColor(
    seed: seed,
    value: seed,
    light: ColorFamily(
      color: light.primary,
      onColor: light.onPrimary,
      colorContainer: light.primaryContainer,
      onColorContainer: light.onPrimaryContainer,
    ),
    dark: ColorFamily(
      color: dark.secondary,
      onColor: dark.onSecondary,
      colorContainer: dark.secondaryContainer,
      onColorContainer: dark.onSecondaryContainer,
    ),
  );
}
