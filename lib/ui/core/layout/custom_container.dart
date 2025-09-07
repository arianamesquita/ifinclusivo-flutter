import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/responsive_utils.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  final bool showBackButton; // controle se botão aparece
  final bool alwaysActive; // se deve aparecer mesmo sem nada na pilha
  final VoidCallback? onBack; // callback customizável
  const CustomContainer({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.alwaysActive = false,
    this.onBack,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  double _childHeight = 0;

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);


    final double figura2Top = (264 + _childHeight).clamp(497, 1100);

    final bool canShowBack =
        widget.showBackButton &&
        (widget.alwaysActive || GoRouter.of(context).canPop());
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            if (canShowBack)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top: 49, left:deviceType == DeviceScreenType.desktop ?75:5),
                  child: ElevatedButton.icon(
                    onPressed:
                    widget.onBack ??
                            () {
                          if (GoRouter.of(context).canPop()) {
                            GoRouter.of(context).pop();
                          }
                        },
                    label: Text('voltar'),
                    icon: Icon(Icons.logout_rounded, size: 24),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                      Theme.of(context).colorScheme.inverseSurface,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      elevation: 0,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // figura 1
                Column(
                  children: [
                    SizedBox(height: 264),
                    SvgPicture.asset(
                      'assets/figuras decorativas lado direito.svg',
                      fit: BoxFit.cover,
                      width: deviceType == DeviceScreenType.desktop ? null : deviceType == DeviceScreenType.tablet?80:40,
                    ),
                  ],
                ),

                // medir child
                Expanded( // <<-- AQUI a mudança principal
                  child: _MeasureSize(
                    onChange: (size) {
                      if (size.height != _childHeight) {
                        setState(() => _childHeight = size.height);
                      }
                    },
                    child: Center(child: widget.child),
                  ),
                ),


                Column(
                  children: [
                    SizedBox(height: figura2Top ),
                    SvgPicture.asset(
                      "assets/figuras decorativas lado esquerdo.svg",
                      fit: BoxFit.cover,
                      width: deviceType == DeviceScreenType.desktop ? null : deviceType == DeviceScreenType.tablet?80:40,
                    ),
                    SizedBox(height: 40),
                  ],
                ),

                // espaço até figura 2
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// helper para medir altura do child
class _MeasureSize extends SingleChildRenderObjectWidget {
  final ValueChanged<Size> onChange;
  const _MeasureSize({required this.onChange, required Widget super.child});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _MeasureRenderObject(onChange);
}

class _MeasureRenderObject extends RenderProxyBox {
  final ValueChanged<Size> onChange;
  Size? _oldSize;
  _MeasureRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();
    final newSize = child?.size ?? Size.zero;
    if (_oldSize != newSize) {
      _oldSize = newSize;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onChange(newSize);
      });
    }
  }
}
