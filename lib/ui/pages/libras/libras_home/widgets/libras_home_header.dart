import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:if_inclusivo/ui/core/layout/app_header.dart';

import '../../../../../utils/responsive_utils.dart';

class LibrasHomeHeader extends StatelessWidget {
  const LibrasHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    DeviceScreenType device = ResponsiveUtils.getDeviceType(context);

    return device == DeviceScreenType.mobile
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5,
                children: [
                  SvgPicture.asset(
                    'assets/logo/logo_short_dark.svg',
                    height: 60,
                  ),
                  Text(
                    'Converte libras',
                    style: textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
            ],
          ),
        )
        : AppHeader(
          title: 'CONVERTE LIBRAS',
          subTitle: 'Um dicionário de sinais criado para a comunidade.',
        );
  }
}
