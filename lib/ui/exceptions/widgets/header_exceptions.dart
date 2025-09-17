import 'package:flutter/material.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class HeaderExceptions extends StatelessWidget {
  final String title;
  final String label;
  const HeaderExceptions({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtils.getDeviceType(context)== DeviceScreenType.mobile?Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Tooltip(
          message: label,
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

        ),
      ],
    ):
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 26,
      children: [

        Padding(
          padding: const EdgeInsets.only(top: 87.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
