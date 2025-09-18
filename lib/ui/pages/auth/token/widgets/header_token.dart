import 'package:flutter/material.dart';

import '../../../../../utils/responsive_utils.dart';

class HeaderToken extends StatelessWidget  {
  final String title;
  final String? label;
  const HeaderToken({super.key, required this.title,  this.label});

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if(label != null)
            Tooltip(
              message: label,
              child: Text(
                label!,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        )
        : Column(
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
            if(label != null)
            Text(
              label!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        );
  }

}
