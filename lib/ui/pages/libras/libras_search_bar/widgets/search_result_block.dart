import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SearchResultBlock extends StatefulWidget {
  final String url;
  final String topicName;
  final String description;
  final GestureTapCallback onTap;

  const SearchResultBlock({
    super.key,
    required this.url,
    required this.topicName,
    required this.description,
    required this.onTap,
  });

  @override
  State<SearchResultBlock> createState() => _SearchResultBlockState();
}

class _SearchResultBlockState extends State<SearchResultBlock> {
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
        showControls: false,
        showFullscreenButton: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    videoId = YoutubePlayerController.convertUrlToId(widget.url)!;
    return HoverEffect(
      child: Center(
        child: InkWell(
          onTap: widget.onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                YoutubePlayerController.getThumbnail(
                  videoId: videoId,
                  quality: ThumbnailQuality.high,
                  webp: false,
                ),
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.topicName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}