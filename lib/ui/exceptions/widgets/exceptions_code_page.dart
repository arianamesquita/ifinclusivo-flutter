import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

import 'custom_app_bar_exceptions.dart';
import 'header_exceptions.dart';

class ExceptionsCodePage extends StatelessWidget {
  final String title;
 final  String label;
  final String svgPath;
  const ExceptionsCodePage({super.key, required this.title, required this.label, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceScreenType = ResponsiveUtils.getDeviceType(context);
    return Scaffold(
      appBar: CustomAppBarExceptions(),
      body:
      Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(deviceScreenType == DeviceScreenType.desktop)Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/exceptions/Figuras Decorativas.svg'),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderExceptions(title: title, label: label),
                  SvgPicture.asset(svgPath),
                ],
              ),

            ),
          ),
          if(deviceScreenType == DeviceScreenType.desktop) Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/exceptions/Figuras Decorativas-1.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
