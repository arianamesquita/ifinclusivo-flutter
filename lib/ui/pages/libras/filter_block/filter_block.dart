import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';

class FilterBlock extends StatelessWidget {
  final String imageAsset;
  final String label;
  final GestureTapCallback onTap;

  const FilterBlock({required this.label, required this.onTap, required this.imageAsset, super.key});

  @override
  Widget build(BuildContext context) {
    return HoverEffect(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          hoverColor:const Color.fromRGBO(133, 224, 224, 1),
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: Container(
            width: 201,
            height: 156,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(104, 187, 158, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageAsset, width: 57, height: 57, color: Colors.white),
                SizedBox(height: 15,),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
