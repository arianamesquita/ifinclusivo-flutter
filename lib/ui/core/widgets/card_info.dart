import 'package:flutter/material.dart';

import '../../../utils/responsive_utils.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String label;
  final TextStyle? labelStyle;
  final double? maxWidth;
  const CardInfo({
    super.key, required this.title, this.titleStyle, required this.label, this.labelStyle, this.maxWidth,

  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final spacing = ResponsiveUtils.spacing(context);
    final textScale =ResponsiveUtils.fontScale(context);
    return
    maxWidth == null ? buildComponent(deviceType, spacing, context, textScale):
     ConstrainedBox(constraints: BoxConstraints(maxWidth: maxWidth!),
      child: buildComponent(deviceType, spacing, context, textScale),
    );
  }

  Column buildComponent(DeviceScreenType deviceType, (double, double) spacing, BuildContext context, double textScale) {
    return Column(
      spacing: deviceType == DeviceScreenType.desktop? 37: spacing.$2,
      children: [
        Text(title, style: titleStyle?? Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: (Theme.of(context).textTheme.headlineSmall?.fontSize?? 25)* textScale,
          color: Theme.of(context).colorScheme.onSurface


        ), softWrap: true),
        Card(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Padding(
            padding: EdgeInsets.all(38),
            child: Text(label, style: labelStyle?? Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: (Theme.of(context).textTheme.titleLarge?.fontSize?? 20)* textScale,
              color: Theme.of(context).colorScheme.inverseSurface

            ), softWrap: true),
          ),
        ),
      ],
    );
  }
}
