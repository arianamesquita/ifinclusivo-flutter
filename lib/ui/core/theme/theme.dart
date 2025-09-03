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

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4b2859),
      surfaceTint: Color(0xff765084),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff865e94),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff113f15),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4a7847),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003e2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2b7a62),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25851),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff0c1211),
      onSurfaceVariant: Color(0xff37353e),
      outline: Color(0xff54515a),
      outlineVariant: Color(0xff6f6b75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xffe4b7f3),
      primaryFixed: Color(0xff865e94),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6c467a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4a7847),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff325f31),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2b7a62),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff01614a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1c8c5),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe3eae7),
      surfaceContainerHigh: Color(0xffd8dedc),
      surfaceContainerHighest: Color(0xffcdd3d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff401d4e),
      surfaceTint: Color(0xff765084),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f3b6e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff05340b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff265326),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003326),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005440),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2d2b33),
      outlineVariant: Color(0xff4a4851),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xffe4b7f3),
      primaryFixed: Color(0xff5f3b6e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff472455),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff265326),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0d3b11),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005440),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003a2c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bab8),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2ef),
      surfaceContainer: Color(0xffdde4e1),
      surfaceContainerHigh: Color(0xffcfd6d3),
      surfaceContainerHighest: Color(0xffc1c8c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
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

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff5d0ff),
      surfaceTint: Color(0xffe4b7f3),
      onPrimary: Color(0xff391647),
      primaryContainer: Color(0xffac82ba),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb6eaae),
      onSecondary: Color(0xff002d06),
      secondaryContainer: Color(0xff6d9c68),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9eeccf),
      onTertiary: Color(0xff002c20),
      tertiaryContainer: Color(0xff529f85),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130f),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe0dae6),
      outline: Color(0xffb5b0bb),
      outlineVariant: Color(0xff938f99),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff5e3a6c),
      primaryFixed: Color(0xfff8d8ff),
      onPrimaryFixed: Color(0xff220031),
      primaryFixedDim: Color(0xffe4b7f3),
      onPrimaryFixedVariant: Color(0xff4b2859),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff001602),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff113f15),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff00150e),
      tertiaryFixedDim: Color(0xff89d6b9),
      onTertiaryFixedVariant: Color(0xff003e2f),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff3f4644),
      surfaceContainerLowest: Color(0xff040807),
      surfaceContainerLow: Color(0xff181f1d),
      surfaceContainer: Color(0xff232928),
      surfaceContainerHigh: Color(0xff2d3432),
      surfaceContainerHighest: Color(0xff383f3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffeeaff),
      surfaceTint: Color(0xffe4b7f3),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe0b3ef),
      onPrimaryContainer: Color(0xff190025),
      secondary: Color(0xffc9fec1),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9dcf96),
      onSecondaryContainer: Color(0xff000f01),
      tertiary: Color(0xffb6ffe3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff85d2b6),
      onTertiaryContainer: Color(0xff000e09),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea5),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff3eef9),
      outlineVariant: Color(0xffc5c1cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff5e3a6c),
      primaryFixed: Color(0xfff8d8ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe4b7f3),
      onPrimaryFixedVariant: Color(0xff220031),
      secondaryFixed: Color(0xffbcf0b4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa1d39a),
      onSecondaryFixedVariant: Color(0xff001602),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff89d6b9),
      onTertiaryFixedVariant: Color(0xff00150e),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff4b5150),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1a211f),
      surfaceContainer: Color(0xff2b3230),
      surfaceContainerHigh: Color(0xff363d3b),
      surfaceContainerHighest: Color(0xff424846),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
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
