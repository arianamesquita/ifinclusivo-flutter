import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/animations/hover_effect.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SearchResultBlock extends ListTile {
  final String url;
  final String topicName;
  final String description;

  const SearchResultBlock({
    super.key,
    required this.url,
    required this.topicName,
    required this.description,
    required super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String videoId = YoutubePlayerController.convertUrlToId(url) ?? '';
    if (videoId.isEmpty) {
      return const SizedBox.shrink();
    }

    return HoverEffect(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    topicName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
