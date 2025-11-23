import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../../utils/text_formater.dart';

class SpecificTopic extends StatefulWidget {
  final String title;
  final String url;
  final String description;
  final GestureTapCallback onTap;

  const SpecificTopic({
    super.key,
    required this.title,
    required this.url,
    required this.description,
    required this.onTap,
  });

  @override
  State<SpecificTopic> createState() => _SpecificTopicState();
}

class _SpecificTopicState extends State<SpecificTopic> {
  late YoutubePlayerController _controller;
  String videoId = '';

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
    videoId = YoutubePlayerController.convertUrlToId(widget.url)!;
    String palavra = formatarTexto(widget.title);

    return HoverEffect(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: widget.onTap,
          child: Container(
            width: 350,
            height: 361,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(200, 255, 192, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        YoutubePlayerController.getThumbnail(
                          videoId: videoId,
                          quality: ThumbnailQuality.high,
                          webp: false,
                        ), fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 21),
                  Text(
                    textAlign: TextAlign.center,
                    palavra,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    textAlign: TextAlign.start,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
