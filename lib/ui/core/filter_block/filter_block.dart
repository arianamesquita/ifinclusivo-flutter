import 'package:flutter/material.dart';

class FilterBlock extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback onTap;

  const FilterBlock({required this.label, required this.onTap, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        hoverColor:const Color.fromRGBO(133, 224, 224, 1),
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Container(
          width: 201,
          height: 161,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromRGBO(133, 224, 224, 0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 87, color: const Color.fromRGBO(1, 0, 4, 0.69)),
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromRGBO(1, 0, 4, 0.69),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
