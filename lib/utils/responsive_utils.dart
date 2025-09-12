import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, tablet, desktop }



class ResponsiveUtils {
  static DeviceScreenType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return DeviceScreenType.mobile;
    } else if (width >= 600 && width < 1024) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.desktop;
    }
  }

  /// Escala de fonte
  static double fontScale(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceScreenType.mobile:
        return 0.6;
      case DeviceScreenType.tablet:
        return 0.9;
      case DeviceScreenType.desktop:
        return 1.0;
    }
  }

  static TextStyle scaleFontStyle(BuildContext context, TextStyle style){
    return style.copyWith(
      fontSize:  style.fontSize! * fontScale(context),
    );
  }

  /// Padding padrão por device type
  static EdgeInsets defaultPadding(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceScreenType.mobile:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 20);
      case DeviceScreenType.tablet:
        return const EdgeInsets.symmetric(horizontal: 40, vertical: 28);
      case DeviceScreenType.desktop:
        return const EdgeInsets.symmetric(horizontal: 80, vertical: 36);
    }
  }

  /// Espaçamento entre elementos (ex: SizedBox)
  static (double width, double height) spacing(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceScreenType.mobile:
        return ( 12,20);
      case DeviceScreenType.tablet:
        return (20,18);
      case DeviceScreenType.desktop:
        return (35,25);
    }
  }
}
