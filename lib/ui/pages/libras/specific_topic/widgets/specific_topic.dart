import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../../utils/text_formater.dart';

class SpecificTopic extends StatefulWidget {
  final String title;
  final String description;
  final GestureTapCallback onTap;

  const SpecificTopic({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  State<SpecificTopic> createState() => _SpecificTopicState();
}

class _SpecificTopicState extends State<SpecificTopic> {
  late YoutubePlayerController _controller;
  String videoId = YoutubePlayerController.convertUrlToId("https://www.youtube.com/watch?v=F3TiMx-zG-A")!;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: true,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String palavra = formatarTexto(widget.title);

    return HoverEffect(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: widget.onTap,
          child: Container(
            width: 387,
            height: 361,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromRGBO(200, 255, 192, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    YoutubePlayerController.getThumbnail(
                      videoId: videoId,
                      quality: ThumbnailQuality.high,
                      webp: false,
                    ), fit: BoxFit.cover,
                  ),
                  SizedBox(height: 15),
                  Text(
                    textAlign: TextAlign.center,
                    palavra,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    textAlign: TextAlign.center,
                    widget.description,
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
