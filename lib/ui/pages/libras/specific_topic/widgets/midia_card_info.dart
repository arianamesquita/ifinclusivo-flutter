import 'package:flutter/material.dart';

// Presumo que estas classes 'utils' existam em seu projeto.
// Se elas não existirem, você terá que substituí-las por valores fixos ou implementá-las.
import '../../../../../utils/responsive_utils.dart';

class MidiaCardInfo extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String label;
  final TextStyle? labelStyle;
  final double? maxWidth;
  final double spacing;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;

  const MidiaCardInfo({
    super.key,
    required this.title,
    this.titleStyle,
    required this.label,
    this.labelStyle,
    this.maxWidth,
    this.textAlign = TextAlign.center,
    this.spacing = 37,
    this.padding = const EdgeInsets.all(38),
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    final spacing = ResponsiveUtils.spacing(context);
    final textScale = ResponsiveUtils.fontScale(context);

    return maxWidth == null
        ? buildComponent(deviceType, spacing, context, textScale)
        : ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth!),
      child: buildComponent(deviceType, spacing, context, textScale),
    );
  }

  Widget buildComponent(
      DeviceScreenType deviceType,
      (double, double) spacings,
      BuildContext context,
      double textScale,
      ) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 24, right: 15, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: titleStyle ??
                  Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: (Theme.of(context).textTheme.headlineSmall?.fontSize ?? 25) * textScale,
                  ),
              softWrap: true,
              textAlign: textAlign == TextAlign.center || textAlign == TextAlign.right
                  ? textAlign
                  : TextAlign.start,
            ),

            const SizedBox(height: 8.0),

            Text(
              label,
              style: labelStyle ??
                  Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: (Theme.of(context).textTheme.titleLarge?.fontSize ?? 20) * textScale,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
              softWrap: true,
              textAlign: textAlign,
            ),
          ],
        ),
      ),
    );
  }
}