import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LibrasVideoPlayerWeb extends StatefulWidget {
  final String videoUrl;

  const LibrasVideoPlayerWeb({super.key, required this.videoUrl});

  @override
  State<LibrasVideoPlayerWeb> createState() => _LibrasVideoPlayerWebState();
}

class _LibrasVideoPlayerWebState extends State<LibrasVideoPlayerWeb> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // ID do vídeo (Use o de teste primeiro para garantir)
    final  videoId = YoutubePlayerController.convertUrlToId(widget.videoUrl);

    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId??'',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        enableJavaScript: true,
        playsInline: true,
        userAgent: 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36',
      ),
    );
  }
  @override
  void dispose() {
    // O close() é essencial para matar o processo do WebView e evitar o erro setSize
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      enableFullScreenOnVerticalDrag: false,
      builder: (context, player) {
        return Column(children: [player]);
      },
    );
  }
}
