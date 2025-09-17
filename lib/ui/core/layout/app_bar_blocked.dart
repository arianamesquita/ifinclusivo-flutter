import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/app_router.dart';
import '../../../utils/responsive_utils.dart';
import '../theme/theme.dart';
import '../widgets/hoverable_logo.dart';

class CustomAppBarBlocked extends StatelessWidget {
  const CustomAppBarBlocked({
    super.key,
    required this.onPressedSingIn,
    required this.onPressedSingUp,
  });
  final VoidCallback? onPressedSingIn;
  final VoidCallback? onPressedSingUp;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width<621;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child:
              isMobile
                  ? Padding(
                    padding: ResponsiveUtils.defaultPadding(context),
                    child: Center(
                      child: _buildLogoAndButtons(isMobile, context),
                    ),
                  )
                  : Padding(
                    padding: EdgeInsets.only(left: 69, top: 11, bottom: 11.0),
                    child: _buildLogoAndButtons(isMobile, context),
                  ),
        ),

        if (!isMobile)
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset("assets/Figuras Decorativas.svg"),
          ),
      ],
    );
  }

  Row _buildLogoAndButtons(bool isMobile, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            alignment:
                isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              HoverableLogo(
                onTap: () => context.go(AboutUsRoute().location),
                imagePath: 'assets/logo/logo_expanded_light.svg',
                height: 138,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top:
                      isMobile
                          ? 12.0
                          :  0,
                ),
                child: _buildButtons(context),
              ),
            ],
          ),
        ),
        if (!isMobile) SizedBox(width: 238),
      ],
    );
  }

  Row _buildButtons(BuildContext context) {
    final secondary40 = MaterialTheme(Theme.of(context).textTheme)
        .extendedColors.first;
    final blue = MaterialTheme(Theme.of(context).textTheme)
        .extendedColors[1];
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: ResponsiveUtils.spacing(context).$1,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onPressedSingIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: blue.light.color,
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            foregroundColor: blue.light.onColor,
            maximumSize: Size(141.61, 50),
            minimumSize: Size(140, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text('Login'),
        ),

        ElevatedButton(
          onPressed: onPressedSingUp,
          style: ElevatedButton.styleFrom(
            backgroundColor: secondary40.light.color,
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            foregroundColor: secondary40.light.onColor,
            maximumSize: Size(179.5, 50),
            minimumSize: Size(170, 50),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text('Cadastre-se'),
        ),
      ],
    );
  }
}
