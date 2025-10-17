import 'package:flutter/material.dart';

import '../../../utils/responsive_utils.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String label;
  final TextStyle? labelStyle;
  final double? maxWidth;
  final double spacing;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  const CardInfo({
    super.key,
    required this.title,
    this.titleStyle,
    required this.label,
    this.labelStyle,
    this.maxWidth,
    this.textAlign = TextAlign.center,
    this.spacing = 37,
    this.padding =const EdgeInsets.all(38),
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final spacing = ResponsiveUtils.spacing(context);
    return maxWidth == null
        ? buildComponent(deviceType, spacing, context)
        : ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth!),
          child: buildComponent(deviceType, spacing, context),
        );
  }

  Column buildComponent(
    DeviceScreenType deviceType,
    (double, double) spacings,
    BuildContext context,
  ) {
    return Column(
      spacing: deviceType == DeviceScreenType.desktop ? spacing : spacings.$2,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    titleStyle ??
                    Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                softWrap: true,
                textAlign: textAlign,
              ),
            ),
          ],
        ),
        Card(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Padding(
            padding: padding,
            child: Text(
              label,
              style:
                  labelStyle ??
                  Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
