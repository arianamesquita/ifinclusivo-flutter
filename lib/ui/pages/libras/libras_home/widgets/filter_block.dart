import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';

class FilterBlock extends StatelessWidget {
  final String imageAsset;
  final String label;
  final GestureTapCallback onTap;

  const FilterBlock({
    required this.label,
    required this.onTap,
    required this.imageAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile =
        ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;
    return HoverEffect(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          hoverColor: const Color.fromRGBO(133, 224, 224, 1),
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(104, 187, 158, 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 1, child: SizedBox.shrink()),
                Flexible(
                  flex: 4,
                  child: Image.asset(
                    imageAsset,
                    width: 57,
                    height: 57,
                    color: Colors.white,
                  ),
                ),
                Flexible(flex: 1, child: SizedBox.shrink()),
                Flexible(
                  flex: 4,
                  child: Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(flex: 1, child: SizedBox.shrink()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
