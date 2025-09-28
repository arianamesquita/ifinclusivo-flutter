import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';

class SpecificTopic extends StatelessWidget {
  final String title;
  final String urlVideo;
  final String description;
  final GestureTapCallback onTap;

  const SpecificTopic({
    super.key,
    required this.title,
    required this.urlVideo,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HoverEffect(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: Container(
            width: 387,
            height: 361,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(200, 255, 192, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(37),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(urlVideo, fit: BoxFit.cover),
                  SizedBox(height: 21),
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    textAlign: TextAlign.center,
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          )

        ),
      ),
    );
  }
}
