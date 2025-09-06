import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
    final double figura2Top = (264 + _childHeight).clamp(572, 1100);
    final bool canShowBack =
        widget.showBackButton &&
        (widget.alwaysActive || GoRouter.of(context).canPop());
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // figura 1
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 264),
                    SvgPicture.asset(
                      'assets/figuras decorativas lado direito.svg',
                    ),
                  ],
                ),
                if (canShowBack)
                  Padding(
                    padding: const EdgeInsets.only(top: 49, left: 75),
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
              ],
            ),

            // medir child
            _MeasureSize(
              onChange: (size) {
                if (size.height != _childHeight) {
                  setState(() => _childHeight = size.height);
                }
              },
              child: Center(child: widget.child),
            ),

            Column(
              children: [
                SizedBox(height: figura2Top),
                SvgPicture.asset(
                  "assets/figuras decorativas lado esquerdo.svg",
                ),
                SizedBox(height: 40),
              ],
            ),

            // espaço até figura 2
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
