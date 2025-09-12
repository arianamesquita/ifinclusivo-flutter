import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_us_router.dart';

import '../../../utils/responsive_utils.dart';
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
                imagePath: 'assets/logo_oficial_expanded.png',
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: ResponsiveUtils.spacing(context).$1,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onPressedSingIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(28, 122, 229, 1.0),
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            foregroundColor: Theme.of(context).colorScheme.onTertiary,
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
            backgroundColor: Color.fromRGBO(98, 191, 98, 1.0),
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            foregroundColor: Theme.of(context).colorScheme.onTertiary,
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
