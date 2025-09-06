import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/routing/pages/about_routes/routes/about_us_router.dart';

import '../../../utils/responsive_utils.dart';

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
    final isMobile =
        ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;
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
              _HoverableLogo(
                onTap: () => context.go('/presentation'),
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
            backgroundColor: const Color.fromRGBO(28, 122, 229, 1),
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
            backgroundColor: Theme.of(context).colorScheme.secondary,
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


class _HoverableLogo extends StatefulWidget {
  final String imagePath;
  final double height;
  final VoidCallback onTap;

  const _HoverableLogo({
    required this.imagePath,
    required this.height,
    required this.onTap,
  });

  @override
  State<_HoverableLogo> createState() => _HoverableLogoState();
}

class _HoverableLogoState extends State<_HoverableLogo> {
  bool _hovering = false;
  bool _pressed = false;

  void _onTapDown(TapDownDetails details) => setState(() => _pressed = true);
  void _onTapUp(TapUpDetails details) => setState(() => _pressed = false);
  void _onTapCancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    // calcula deslocamento: sobe no hover, afunda no click
    double translateY = 0;
    if (_hovering) translateY -= 5;   // sobe 5px
    if (_pressed) translateY += 3;     // afunda 3px ao clicar

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.identity()..translate(0, translateY, 0),
          child: Image.asset(
            widget.imagePath,
            height: widget.height,
          ),
        ),
      ),
    );
  }
}
