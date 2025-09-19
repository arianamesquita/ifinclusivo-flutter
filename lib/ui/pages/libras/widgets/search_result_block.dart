import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultBlock extends StatelessWidget{
  final String img;
  final String topicName;
  final String description;

  const SearchResultBlock({super.key, this.img = 'assets/video.png', required this.topicName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img, fit: BoxFit.cover,),
        Column(
          children: [
            Text(topicName, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 7,),
            Text(description, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }

}